#!/bin/sh
#
# This is free and unencumbered software released into the public domain.
#
# Anyone is free to copy, modify, publish, use, compile, sell, or
# distribute this software, either in source code form or as a compiled
# binary, for any purpose, commercial or non-commercial, and by any
# means.
#
# In jurisdictions that recognize copyright laws, the author or authors
# of this software dedicate any and all copyright interest in the
# software to the public domain. We make this dedication for the benefit
# of the public at large and to the detriment of our heirs and
# successors. We intend this dedication to be an overt act of
# relinquishment in perpetuity of all present and future rights to this
# software under copyright law.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
# IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
# OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
# ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
# OTHER DEALINGS IN THE SOFTWARE.
#
# For more information, please refer to <http://unlicense.org/>
#

# localization.sh automatically fetches localization data and inserts them
# into a Lua file.

# POSIX tools.
mv=mv
rm=rm
sed=sed

# Non-POSIX tools.
curl=curl

unix2dos() {
	$sed -i "s/$/\r/" "$1"
}

# The name of the file to append the localization data.
localization_filename="../Localization.lua"

# The URL of the project development site.
project_url="http://wow.curseforge.com/addons/ovale"

# Locales supported by the CurseForge localization web application.
locales="deDE enUS esES esMX frFR itIT koKR ptBR ruRU zhCN zhTW"

GetLocalization() {
	_gl_locale=$1; shift
	_gl_params="format=lua_additive_table&language=$_gl_locale&handle_unlocalized=blank&handle_subnamespaces=concat"
	_gl_url="${project_url}/localization/export.txt?$_gl_params"
	$curl --progress-bar "$_gl_url"
}

UpdateLocalization () {
	_ul_filename="$1"; shift
	if [ -f "$_ul_filename" ]; then
		# The temporary output file for the updated localization data.
		_ul_output="$_ul_filename.tmp"

		# Redirect file descriptor 3 to the output file.
		$rm -f "$_ul_output"
		exec 3> "$_ul_output"

		# The string delimiting the portion of the file that is preserved from the
		# rest of the file which is automatically generated.
		_ul_delimiter="THE REST OF THIS FILE IS AUTOMATICALLY GENERATED."

		# Read all of the lines from the file up to and including the delimiter.
		_ul_delimiter_found=
		while IFS='' read -r line; do
			echo "$line" 1>&3
			case "$line" in
			*${_ul_delimiter}*)
				_ul_delimiter_found=true
				echo "-- ANY CHANGES MADE BELOW THIS POINT WILL BE LOST." 1>&3
				echo "-- UPDATE TRANSLATIONS AT:" 1>&3
				echo "--     $project_url/localization" 1>&3
				echo 1>&3
				break
				;;
			esac
		done < "$localization_filename"

		if [ -n "$_ul_delimiter_found" ]; then
			echo "local locale = GetLocale()" 1>&3
			echo 1>&3

			_ul_first=
			for _ul_locale in "$@"; do
				echo "Fetching $_ul_locale locale data."
				if [ -z "$_ul_first" ]; then
					echo "if locale == \"$_ul_locale\" then" 1>&3
					_ul_first=true
				else
					echo "elseif locale == \"$_ul_locale\" then" 1>&3
				fi
				echo 1>&3
				GetLocalization "$_ul_locale" 1>&3
				echo 1>&3
			done
			echo "end" 1>&3
		fi

		# Close file descriptor 3.
		exec 3>&-

		# Overwrite file with new output.
		if [ -f "$_ul_output" ]; then
			unix2dos "$_ul_output"
			$mv -f "$_ul_output" "$localization_filename"
		fi
	fi
}

UpdateLocalization "$localization_filename" $locales