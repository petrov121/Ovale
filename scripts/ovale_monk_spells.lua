local OVALE, Ovale = ...
local OvaleScripts = Ovale.OvaleScripts

do
	local name = "ovale_monk_spells"
	local desc = "[6.0.2] Ovale: Monk spells"
	local code = [[
# Monk spells and functions.

Define(blackout_kick 100784)
	SpellInfo(blackout_kick chi=2)
	SpellInfo(blackout_kick buff_chi_none=serenity_buff if_spell=serenity)
	SpellInfo(blackout_kick buff_chi_none=blackout_kick_no_chi_buff if_stance=monk_stance_of_the_fierce_tiger)
	SpellInfo(blackout_kick buff_chi=focus_of_xuen_buff buff_chi_amount=-1 itemset=T16_melee itemcount=4)
	SpellAddBuff(blackout_kick combo_breaker_bok_buff=0 if_stance=monk_stance_of_the_fierce_tiger)
	SpellAddBuff(blackout_kick cranes_zeal_buff=1 if_stance=monk_stance_of_the_spirited_crane)
	SpellAddBuff(blackout_kick shuffle_buff=1 if_stance=monk_stance_of_the_sturdy_ox)
SpellList(blackout_kick_no_chi_buff combo_breaker_bok_buff serenity_buff)
Define(breath_of_fire 115181)
	SpellInfo(breath_of_fire chi=2)
	SpellInfo(breath_of_fire buff_chi_none=serenity_buff if_spell=serenity)
	SpellAddTargetBuff(breath_of_fire breath_of_fire_debuff=1 if_spell=improved_breath_of_fire)
Define(breath_of_fire_debuff 123725)
	SpellInfo(breath_of_fire_debuff duration=8 tick=2)
Define(crackling_jade_lightning 117952)
	SpellInfo(crackling_jade_lightning channel=4)
	SpellAddBuff(crackling_jade_lightning power_strikes_buff=0 talent=power_strikes_talent)
Define(cranes_zeal_buff 127722)
	SpellInfo(cranes_zeal_buff duration=20)
Define(chi_brew 115399)
	SpellInfo(chi_brew chi=-2 gcd=0)
	SpellAddBuff(chi_brew elusive_brew_stacks_buff=5 if_spell=elusive_brew)
	SpellAddBuff(chi_brew mana_tea_buff=1 if_spell=mana_tea glyph=!glyph_of_mana_tea)
	SpellAddBuff(chi_brew mana_tea_buff=1 if_spell=mana_tea_glyphed glyph=glyph_of_mana_tea)
	SpellAddBuff(chi_brew tigereye_brew_buff=2 if_spell=tigereye_brew)
Define(chi_brew_talent 9)
Define(chi_burst 123986)
	SpellInfo(chi_burst cd=30)
Define(chi_burst_talent 6)
Define(chi_explosion_heal 157675)
	SpellInfo(chi_explosion_heal chi=finisher max_chi=4)
Define(chi_explosion_melee 152174)
	SpellInfo(chi_explosion_melee chi=finisher max_chi=4)
	SpellInfo(chi_explosion_melee buff_chi=combo_breaker_ce_buff buff_chi_amount=-2)
Define(chi_explosion_tank 157676)
	SpellInfo(chi_explosion_tank chi=finisher max_chi=4)
Define(chi_explosion_talent 20)
Define(chi_wave 115098)
	SpellInfo(chi_wave cd=15)
Define(chi_wave_talent 4)
Define(combo_breaker 137384)
Define(combo_breaker_bok_buff 116768)
	SpellInfo(combo_breaker_bok_buff duration=15)
Define(combo_breaker_ce_buff 159407)
	SpellInfo(combo_breaker_ce_buff duration=15)
Define(combo_breaker_tp_buff 118864)
	SpellInfo(combo_breaker_tp_buff duration=15)
Define(dampen_harm 122278)
	SpellInfo(dampen_harm cd=90 gcd=0)
	SpellAddBuff(dampen_harm dampen_harm_buff=3)
Define(dampen_harm_buff 122278)
	SpellInfo(dampen_harm_buff duration=45)
Define(dampen_harm_talent 14)
Define(death_note_buff 121125)
Define(detonate_chi 115460)
	SpellInfo(detonate_chi cd=10)
Define(diffuse_magic 122783)
	SpellInfo(diffuse_magic cd=90 gcd=0)
Define(diffuse_magic_talent 15)
Define(dizzying_haze_debuff 116330)
	SpellInfo(dizzying_haze_debuff duration=15)
Define(elusive_brew 115308)
	SpellInfo(elusive_brew cd=9 gcd=0)
	SpellAddBuff(elusive_brew elusive_brew_activated_buff=1 elusive_brew_stacks_buff=0)
Define(elusive_brew_activated_buff 115308)
	SpellInfo(elusive_brew_activated_buff duration=1)
Define(elusive_brew_stacks_buff 128939)
	SpellInfo(elusive_brew_stacks_buff duration=30 max_stacks=15)
Define(empowered_spinning_crane_kick 157415)
Define(energizing_brew 115288)
	SpellInfo(energizing_brew cd=60 gcd=0)
	SpellInfo(energizing_brew buff_cdr=cooldown_reduction_agility_buff)
	SpellAddBuff(energizing_brew energizing_brew_buff=1)
Define(energizing_brew_buff 115288)
	SpellInfo(energizing_brew_buff duration=6 tick=1)
	SpellInfo(energizing_brew_buff addduration=5 itemset=T14_melee itemcount=4)
Define(enveloping_mist 124682)
	SpellInfo(enveloping_mist chi=3)
	SpellAddTargetBuff(enveloping_mist enveloping_mist_buff=1)
Define(enveloping_mist_buff 132120)
	SpellInfo(enveloping_mist_buff duration=6 tick=1)
Define(expel_harm 115072)
	SpellInfo(expel_harm cd=15 chi=-1)
	SpellInfo(expel_harm energy=40 specialization=!mistweaver)
	SpellInfo(expel_harm chi=-2 if_stance=monk_stance_of_the_fierce_tiger)
	SpellInfo(expel_harm unusable=1 glyph=glyph_of_targeted_explusion)
	SpellAddBuff(expel_harm power_strikes_buff=0 talent=power_strikes_talent)
Define(expel_harm_glyphed 147489)
	SpellInfo(expel_harm_glyphed cd=15 chi=-1)
	SpellInfo(expel_harm_glyphed energy=40 specialization=!mistweaver)
	SpellInfo(expel_harm_glyphed chi=-2 if_stance=monk_stance_of_the_fierce_tiger)
	SpellInfo(expel_harm_glyphed unusable=1 glyph=!glyph_of_targeted_explusion)
	SpellAddBuff(expel_harm_glyphed power_strikes_buff=0 talent=power_strikes_talent)
Define(fists_of_fury 113656)
	SpellInfo(fists_of_fury channel=4 cd=25 chi=3)
	SpellInfo(fists_of_fury addcd=-5 itemset=T14_melee itemcount=2)
	SpellInfo(fists_of_fury buff_chi_none=serenity_buff if_spell=serenity)
	SpellInfo(fists_of_fury buff_chi=focus_of_xuen_buff buff_chi_amount=-1 itemset=T16_melee itemcount=4)
	SpellInfo(fists_of_fury buff_cdr=cooldown_reduction_agility_buff)
Define(focus_of_xuen_buff 145024)
	SpellInfo(focus_of_xuen_buff duration=10)
Define(fortifying_brew 115203)
	SpellInfo(fortifying_brew cd=180 gcd=0)
	SpellInfo(fortifying_brew buff_cdr=cooldown_reduction_agility_buff specialization=windwalker)
	SpellInfo(fortifying_brew buff_cdr=cooldown_reduction_tank_buff specialization=brewmaster)
	SpellAddBuff(fortifying_brew fortifying_brew_buff=1)
Define(fortifying_brew_buff 120954)
	SpellInfo(fortifying_brew_buff duration=15)
Define(glyph_of_guard 123401)
Define(glyph_of_mana_tea 123763)
Define(glyph_of_surging_mist 120483)
Define(glyph_of_targeted_expulsion 146950)
Define(glyph_of_touch_of_death 123391)
Define(guard 115295)
	SpellInfo(guard cd=30 chi=2 gcd=0)
	SpellInfo(guard buff_cdr=cooldown_reduction_tank_buff)
	SpellInfo(guard buff_chi_none=serenity_buff if_spell=serenity)
	SpellInfo(guard unusable=1 glyph=glyph_of_guard)
	SpellAddBuff(guard guard_buff=1)
Define(guard_buff 115295)
	SpellInfo(guard_buff duration=30)
Define(guard_glyphed 123402)
	SpellInfo(guard_glyphed cd=30 chi=2 gcd=0)
	SpellInfo(guard_glyphed buff_cdr=cooldown_reduction_tank_buff)
	SpellInfo(guard_glyphed buff_chi_none=serenity_buff if_spell=serenity)
	SpellInfo(guard_glyphed unusable=1 glyph=!glyph_of_guard)
	SpellAddBuff(guard_glyphed guard_glyphed_buff=1)
Define(guard_glyphed_buff 123402)
	SpellInfo(guard_glyphed duration=30)
Define(heavy_stagger_debuff 124273)
	SpellInfo(heavy_stagger_debuff duration=10 tick=1)
Define(hurricane_strike 152175)
	SpellInfo(hurricane_strike channel=2 cd=45 chi=3)
Define(hurricane_strike_talent 19)
Define(improved_breath_of_fire 157362)
Define(improved_renewing_mist 157398)
Define(invoke_xuen 123904)
	SpellInfo(invoke_xuen cd=180)
Define(invoke_xuen_talent 17)
Define(jab 100780)
	SpellInfo(jab chi=-1)
	SpellInfo(jab chi=-2 if_stance=monk_stance_of_fierce_tiger)
	SpellInfo(jab energy=40 specialization=!mistweaver)
	SpellInfo(jab buff_chi=power_strikes_buff talent=power_strikes_talent)
	SpellAddBuff(jab power_strikes_buff=0 talent=power_strikes_talent)
Define(keg_smash 121253)
	SpellInfo(keg_smash cd=8 chi=-2)
	SpellInfo(keg_smash energy=40 specialization=!mistweaver)
Define(legacy_of_the_emperor 115921)
	SpellAddBuff(legacy_of_the_emperor legacy_of_the_emperor_buff=1)
Define(legacy_of_the_emperor_buff 115921)
	SpellInfo(legacy_of_the_emperor_buff duration=10)
Define(legacy_of_the_white_tiger 116781)
	SpellAddBuff(legacy_of_the_white_tiger legacy_of_the_white_tiger_buff=1)
Define(legacy_of_the_white_tiger_buff 116781)
	SpellInfo(legacy_of_the_white_tiger_buff duration=10)
Define(light_stagger_debuff 124275)
	SpellInfo(light_stagger_debuff duration=10 tick=1)
Define(mana_tea 115294)
	SpellInfo(mana_tea channel=6 texture=inv_misc_herb_jadetealeaf)
	SpellInfo(mana_tea unusable=1 glyph=glyph_of_mana_tea)
Define(mana_tea_buff 115867)
	SpellInfo(mana_tea_buff duration=120 maxstacks=20)
Define(mana_tea_glyphed 123761)
	SpellInfo(mana_tea_glyphed cd=10 texture=inv_misc_herb_jadetealeaf)
	SpellInfo(mana_tea_glyphed unusable=1 glyph=glyph_of_mana_tea)
	SpellAddBuff(mana_tea_glyphed mana_tea_buff=-2)
Define(moderate_stagger_debuff 124274)
	SpellInfo(moderate_stagger_debuff duration=10 tick=1)
Define(nimble_brew 137562)
	SpellInfo(nimble_brew cd=120 gcd=0)
Define(paralysis 115078)
	SpellInfo(paralysis cd=15)
Define(power_strikes_buff 129914)
Define(power_strikes_talent 7)
Define(purifier_buff 138237) # tier15_4pc_tank bonus
	SpellInfo(purifier_buff duration=15)
Define(purifying_brew 119582)
	SpellInfo(purifying_brew cd=1 chi=1 gcd=0)
	SpellInfo(purifying_brew buff_chi_none=serenity_buff if_spell=serenity)
	SpellInfo(purifying_brew buff_chi_none=purifier_buff itemset=T15_tank itemcount=2)
	SpellInfo(purifying_brew buff_chi_none=purifying_brew_no_chi_buff if_spell=serenity itemset=T15_tank itemcount=2)
	SpellAddDebuff(purifying_brew heavy_stagger_debuff=0 light_stagger_debuff=0 moderate_stagger_debuff=0)
SpellList(purifying_brew_no_chi_buff purifier_buff serenity_buff)
Define(renewing_mist 115151)
	SpellInfo(renewing_mist cd=8 chi=-1)
	SpellAddBuff(renewing_mist thunder_focus_tea_buff=0 if_spell=thunder_focus_tea)
	SpellAddTargetBuff(renewing_mist renewing_mist_buff=1)
Define(renewing_mist_buff 119611)
	SpellInfo(renewing_mist_buff duration=18 haste=spell tick=2)
	SpellInfo(renewing_mist_buff addduration=2 if_spell=improved_renewing_mist)
Define(revival 115310)
	SpellInfo(revival cd=180)
Define(rising_sun_kick 107428)
	SpellInfo(rising_sun_kick cd=8 chi=2)
	SpellInfo(rising_sun_kick buff_chi_none=serenity_buff if_spell=serenity)
	SpellInfo(rising_sun_kick buff_chi=focus_of_xuen_buff buff_chi_amount=-1 itemset=T16_melee itemcount=4)
	SpellAddTargetDebuff(rising_sun_kick rising_sun_kick_debuff=1)
Define(rising_sun_kick_debuff 130320)
	SpellInfo(rising_sun_kick_debuff duration=15)
Define(rushing_jade_wind 116847)
	SpellInfo(rushing_jade_wind cd=6 cd_haste=melee)
Define(rushing_jade_wind_talent 16)
Define(serenity 152173)
	SpellInfo(serenity cd=90 gcd=0)
	SpellAddBuff(serenity serenity_buff=1)
Define(serenity_buff 152173)
	SpellInfo(serenity_buff duration=10)
Define(serenity_talent 21)
Define(shuffle_buff 115307)
	SpellInfo(shuffle_buff duration=6)
Define(soothing_mist 115175)
	SpellInfo(soothing_mist cd=1 channel=8)
	SpellInfo(soothing_mist soothing_mist_buff=1)
Define(soothing_mist_buff 115175)
	SpellInfo(soothing_mist_buff duration=8 haste=spell tick=1)
Define(spear_hand_strike 116705)
	SpellInfo(spear_hand_strike cd=15 gcd=0)
Define(spinning_crane_kick 101546)
	SpellInfo(spinning_crane_kick chi=-1 duration=2 haste=melee tick=0.75)
	SpellInfo(spinning_crane_kick addduration=-1 if_spell=empowered_spinning_crane_kick)
	SpellInfo(spinning_crane_kick energy=40 specialization=!mistweaver)
Define(stance_of_the_fierce_tiger 103985)
	SpellInfo(stance_of_the_fierce_tiger to_stance=monk_stance_of_the_fierce_tiger)
	SpellInfo(stance_of_the_fierce_tiger unusable=1 if_stance=monk_stance_of_the_fierce_tiger)
Define(stance_of_the_spirited_crane 154436)
	SpellInfo(stance_of_the_spirited_crane to_stance=monk_stance_of_the_spirited_crane)
	SpellInfo(stance_of_the_spirited_crane unusable=1 if_stance=monk_stance_of_the_spirited_crane)
Define(stance_of_the_sturdy_ox 115069)
	SpellInfo(stance_of_the_sturdy_ox to_stance=monk_stance_of_the_sturdy_ox)
	SpellInfo(stance_of_the_sturdy_ox unusable=1 if_stance=monk_stance_of_the_sturdy_ox)
Define(stance_of_the_wise_serpent 115070)
	SpellInfo(stance_of_the_wise_serpent to_stance=monk_stance_of_the_wise_serpent)
	SpellInfo(stance_of_the_wise_serpent unusable=1 if_stance=monk_stance_of_the_wise_serpent)
Define(summon_black_ox_statue 115315)
	SpellInfo(summon_black_ox_statue cd=10)
Define(summon_jade_serpent_statue 115313)
	SpellInfo(summon_jade_serpent_statue cd=10)
Define(surging_mist 116694)
	SpellInfo(surging_mist chi=-1 if_stance=monk_stance_of_the_wise_serpent)
	SpellInfo(surging_mist unusable=1 glyph=glyph_of_surging_mist)
	SpellAddBuff(surging_mist thunder_focus_tea_buff=0 if_spell=thunder_focus_tea)
	SpellAddBuff(surging_mist vital_mists_buff=0 if_stance=monk_stance_of_the_spirited_crane)
Define(surging_mist_glyphed 123273)
	SpellInfo(surging_mist_glyphed chi=-1)
	SpellInfo(surging_mist unusable=1 glyph=!glyph_of_surging_mist)
	SpellAddBuff(surging_mist_glyphed thunder_focus_tea_buff=0 if_spell=thunder_focus_tea)
	SpellAddBuff(surging_mist_glyphed vital_mists_buff=0 if_stance=monk_stance_of_the_spirited_crane)
Define(thunder_focus_tea 116680)
	SpellInfo(thunder_focus_tea cd=45 gcd=0)
	SpellInfo(thunder_focus_tea addcd=-5 itemset=T15_heal itemcount=4)
	SpellAddBuff(thunder_focus_tea thunder_focus_tea_buff=1)
Define(thunder_focus_tea_buff 116680)
	SpellInfo(thunder_focus_tea duration=30)
Define(tiger_palm 100787)
	SpellInfo(tiger_palm chi=1)
	SpellInfo(tiger_palm buff_chi_none=combo_breaker_tp_buff if_stance=monk_stance_of_the_fierce_tiger)
	SpellInfo(tiger_palm buff_chi_none=tiger_palm_no_chi_buff if_spell=serenity if_stance=monk_stance_of_the_fierce_tiger)
	SpellInfo(tiger_palm chi=0 if_stance=monk_stance_of_the_sturdy_ox)
	SpellAddBuff(tiger_palm tiger_power_buff=1)
	SpellAddBuff(tiger_palm combo_breaker_tp_buff=0 if_stance=monk_stance_of_the_fierce_tiger)
	SpellAddBuff(tiger_palm vital_mists_buff=1 if_stance=monk_stance_of_the_spirited_crane)
SpellList(tiger_palm_no_chi_buff combo_breaker_tp_buff serenity_buff)
Define(tiger_power_buff 125359)
	SpellInfo(tiger_power_buff duration=20)
Define(tigereye_brew 116740)
	SpellInfo(tigereye_brew cd=5 gcd=0)
	SpellAddBuff(tigereye_brew tigereye_brew_buff=-10 tigereye_brew_use_buff=1)
Define(tigereye_brew_buff 125195)
	SpellInfo(tigereye_brew_buff duration=120 maxstacks=20)
Define(tigereye_brew_use_buff 116740)
	SpellInfo(tigereye_brew_use_buff duration=15)
Define(touch_of_death 115080)
	SpellInfo(touch_of_death cd=90 chi=3 target_health_pct=10 buff_no_target_health_pct=death_note_buff)
	SpellInfo(touch_of_death buff_chi_none=serenity_buff if_spell=serenity)
	SpellInfo(touch_of_death addcd=120 chi=0 glyph=glyph_of_touch_of_death)
Define(uplift 116670)
	SpellInfo(uplift chi=2)
Define(vital_mists_buff 118674)
	SpellInfo(vital_mists_buff duration=30)
Define(zen_meditation 115176)
	SpellInfo(zen_meditation cd=180 gcd=0)
	SpellInfo(zen_meditation buff_cdr=cooldown_reduction_agility_buff specialization=windwalker)
	SpellInfo(zen_meditation buff_cdr=cooldown_reduction_tank_buff specialization=brewmaster)
Define(zen_sphere 124081)
	SpellInfo(zen_sphere cd=10)
	SpellAddTargetBuff(zen_sphere zen_sphere_buff=1)
Define(zen_sphere_buff 124081)
	SpellInfo(zen_sphere_buff duration=16 haste=spell tick=2)
Define(zen_sphere_talent 5)
]]

	OvaleScripts:RegisterScript("MONK", name, desc, code, "include")
end
