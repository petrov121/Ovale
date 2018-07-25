import { OvaleScripts } from "../Scripts";

export function register() {
    let name = "ovale_deathknight_spells";
    let desc = "[8.0] Ovale: Death Knight spells";
    let code = `

ItemRequire(shifting_cosmic_sliver unusable 1=oncooldown,!icebound_fortitude,buff,!icebound_fortitude_buff)
	
# Death Knight spells and functions.

# Learned spells.
Define(antimagic_shell 48707)
	SpellInfo(antimagic_shell cd=60 gcd=0 offgcd=1)
	SpellInfo(antimagic_shell add_cd=-15 talent=antimagic_barrier_talent specialization=blood)
Define(antimagic_shell_buff 48707)
	SpellInfo(antimagic_shell_buff duration=5)
	SpellInfo(antimagic_shell_buff add_duration=5 talent=spell_eater_talent specialization=unholy)
Define(apocalypse 275699)
	SpellInfo(apocalypse cd=90)
Define(army_of_the_dead 42650)
	SpellInfo(army_of_the_dead runicpower=-30 runes=3 cd=480)
	SpellAddBuff(army_of_the_dead army_of_the_dead_buff=1)
Define(asphyxiate 108194)
	SpellInfo(asphyxiate cd=45 interrupt=1)
	SpellAddTargetDebuff(asphyxiate asphyxiate_debuff=1)
Define(asphyxiate 108194)
	SpellInfo(asphyxiate_debuff duration=4)
Define(asphyxiate_blood 221562)
	SpellInfo(asphyxiate_blood cd=45 interrupt=1)
	SpellAddTargetDebuff(asphyxiate_blood asphyxiate_blood_debuff=1)
Define(asphyxiate_blood_debuff 221562)
	SpellInfo(asphyxiate_debuff duration=5)
Define(blinding_sleet 207167)
	SpellInfo(blinding_sleet cd=60)
	SpellAddTargetDebuff(blinding_sleet blinding_sleet_debuff=1)
Define(blinding_sleet_debuff 207167)
	SpellInfo(blinding_sleet_debuff duration=5)
Define(blood_boil 50842)
	SpellInfo(blood_boil cd=7.5 cd_haste=melee)
	SpellAddTargetDebuff(blood_boil blood_plague_debuff=1)
	SpellAddBuff(blood_boil hemostasis_buff=1 talent=hemostasis_talent)
Define(blood_plague_debuff 55078)
	SpellInfo(blood_plague_debuff duration=24 tick=3)
Define(blood_shield_buff 77535)
	SpellInfo(blood_shield_buff duration=10)
Define(blooddrinker 206931)
	SpellInfo(blooddrinker cd=30 channel=3 haste=melee)
Define(blooddrinker_debuff 206931)
	SpellInfo(blooddrinker_debuff duration=3 tick=1 haste=melee)
Define(bonestorm 194844)
	SpellInfo(bonestorm cd=60)
	SpellAddBuff(bonestorm bonestorm_buff=1)
Define(bonestorm_buff 194844)
Define(bone_shield_buff 195181)
	SpellInfo(bone_shield_buff duration=30 max_stacks=10)
Define(breath_of_sindragosa 152279)
	SpellInfo(breath_of_sindragosa runicpower=15 cd=120 gcd=0)
	SpellAddBuff(breath_of_sindragosa breath_of_sindragosa_buff=1)
Define(breath_of_sindragosa_buff 152279)
Define(chains_of_ice 45524)
	SpellInfo(chains_of_ice runes=1 runicpower=-10)
	SpellAddBuff(chains_of_ice cold_heart_buff=0 talent=cold_heart_talent)
Define(chains_of_ice_debuff 45524)
	SpellInfo(chains_of_ice_debuff duration=8)
Define(clawing_shadows 207311)
	SpellInfo(clawing_shadows runes=1 runicpower=-10)
	SpellAddTargetDebuff(clawing_shadows festering_wound_debuff=-1)
Define(cold_heart_buff 281209)
	SpellInfo(cold_heart_buff max_stacks=20)
Define(consumption 205223)
	SpellInfo(consumption cd=45)
Define(control_undead 111673)
	SpellInfo(control_undead runes=1 runicpower=-10)
Define(crimson_scourge_buff 81141)
	SpellInfo(crimson_scourge_buff duration=15 specialization=blood)
Define(dancing_rune_weapon 49028)
	SpellInfo(dancing_rune_weapon cd=120 gcd=0)
	SpellAddBuff(dancing_rune_weapon dancing_rune_weapon_buff=1)
Define(dancing_rune_weapon_buff 81256)
	SpellInfo(dancing_rune_weapon_buff duration=8)
Define(dark_command 56222)
	SpellInfo(dark_command cd=8)
Define(dark_succor_buff 101568)
	SpellInfo(dark_succor_buff duration=15)
Define(dark_transformation 63560)
	SpellInfo(dark_transformation cd=60)
	SpellAddPetBuff(dark_transformation dark_transformation_buff=1)
Define(dark_transformation_buff 63560)
	SpellInfo(dark_transformation_buff duration=15)
Define(death_and_decay 43265)
	SpellInfo(death_and_decay runes=1 runicpower=-10 cd=30 specialization=unholy)
	SpellInfo(death_and_decay runes=1 runicpower=-10 cd=15 specialization=blood)
	SpellInfo(death_and_decay replace=defile talent=defile_talent specialization=unholy)
	SpellRequire(death_and_decay runes 0=buff,crimson_scourge_buff)
	SpellRequire(death_and_decay cd_percent 0=buff,crimson_scourge_buff)
	SpellAddTargetDebuff(death_and_decay death_and_decay_debuff=1)
Define(death_and_decay_buff 188290)
Define(death_and_decay_debuff 43265)
Define(death_coil 47541)
	SpellInfo(death_coil runicpower=40 travel_time=1)
	SpellRequire(death_coil runicpower_percent 0=buff,sudden_doom_buff if_spell=sudden_doom)
Define(death_gate 50977)
Define(death_grip 49576)
	SpellInfo(death_grip cd=25)
	SpellInfo(death_grip cd=15 specialization=blood)
Define(death_pact 48743)
	SpellInfo(death_pact cd=120)
	SpellAddBuff(death_pact death_pact_debuff=1)
Define(death_pact_debuff 48743)
	SpellInfo(death_pact_debuff duration=15)
Define(death_strike 49998)
	SpellInfo(death_strike runicpower=45)
	SpellRequire(death_strike add_runicpower -5=buff,death_strike_cost)
	SpellAddBuff(death_strike blood_shield_buff=1 specialization=blood)
	SpellAddBuff(death_strike voracius_buff=1 talent=voracious_talent specialization=blood)
SpellList(death_strike_cost ossuary_buff gravewarden_buff)
Define(deaths_advance 48265)
	SpellInfo(deaths_advance cd=45 gcd=0 offgcd=1)
	SpellAddBuff(deaths_advance deaths_advance_buff=1)
Define(deaths_advance_buff 48265)
	SpellInfo(deaths_advance_buff duration=8)
Define(deaths_caress 195292)
	SpellInfo(deaths_caress runes=1 runicpower=-10)
	SpellAddTargetDebuff(deaths_caress blood_plague_debuff=1)
Define(defile 152280)
	SpellInfo(defile runes=1 runicpower=-10 cd=20)
	SpellAddBuff(defile death_and_decay_buff=1)
	SpellAddTargetDebuff(defile death_and_decay_debuff=1)
Define(defile_debuff 156004)
Define(empower_rune_weapon 47568)
	SpellInfo(empower_rune_weapon cd=120 runicpower=-5 runes=-1 tag=cd)
	SpellAddBuff(empower_rune_weapon empower_rune_weapon_buff=1)
Define(empower_rune_weapon_buff 47568)
	SpellInfo(empower_rune_weapon_buff duration=20)
Define(epidemic 207317)
	SpellInfo(epidemic runicpower=30)
Define(festering_strike 85948)
	SpellInfo(festering_strike runes=2 runicpower=-20)
	SpellAddTargetDebuff(festering_strike festering_wound_debuff=3)
Define(festering_wound_debuff 194310)
	SpellInfo(festering_wound_debuff duration=30 max_stacks=6)
Define(frost_fever_debuff 55095)
	SpellInfo(frost_fever_debuff duration=30 tick=3)
Define(frost_shield_buff 207203)
	SpellInfo(frost_shield_buff duration=10)
Define(frost_strike 49143)
	SpellInfo(frost_strike runicpower=25)
	SpellAddBuff(frost_strike icy_talons_buff=1 talent=icy_talons_talent)
	SpellAddBuff(frost_strike killing_machine_buff 1=buff,pillar_of_frost_buff talent=obliteration_talent)
Define(frostscythe 207230)
	SpellInfo(frostscythe runes=1 runicpower=-10)
Define(frostwyrms_fury 279302)
	SpellInfo(frostwyrms_fury cd=180)
	SpellAddTargetDebuff(frostwyrms_fury frostwyrms_fury_debuff=1)
Define(frostwyrms_fury_debuff 279303)
	SpellInfo(frostwyrms_fury_debuff duration=10)
Define(gathering_storm_buff 194912)
Define(glacial_advance 194913)
	SpellInfo(glacial_advance runicpower=30 cd=6 cd_haste=melee)
	SpellAddBuff(glacial_advance killing_machine_buff 1=buff,pillar_of_frost_buff talent=obliteration_talent)
Define(gorefiends_grasp 108199)
	SpellInfo(gorefiends_grasp cd=120)
	SpellInfo(gorefiends_grasp add_cd=-30 talent=tightening_grasp_talent)
Define(heart_strike 206930)
	SpellInfo(heart_strike runes=1 runicpower=-10)
	SpellInfo(heart_strike add_runicpower=-2 talent=heartbreaker_talent)
Define(haemostasis_buff 273947)
	SpellInfo(haemostasis_buff duration=14 max_stacks=5)
Define(horn_of_winter 57330)
	SpellInfo(horn_of_winter cd=45 runes=-2 runicpower=-20 tag=main)
Define(howling_blast 49184)
	SpellInfo(howling_blast runes=1 runicpower=-10)
	SpellRequire(howling_blast runes 0=buff,rime_buff)
	SpellRequire(howling_blast runicpower_percent 0=buff,rime_buff)
	SpellAddBuff(howling_blast rime_buff=0)
	SpellAddBuff(howling_blast killing_machine_buff 1=buff,pillar_of_frost_buff talent=obliteration_talent)
	SpellAddTargetDebuff(howling_blast frost_fever_debuff=1)
Define(icebound_fortitude 48792)
	SpellInfo(icebound_fortitude cd=180 gcd=0 offgcd=1)
	SpellAddBuff(icebound_fortitude icebound_fortitude_buff=1)
Define(icebound_fortitude_buff 48792)
	SpellInfo(icebound_fortitude_buff duration=8)
Define(icy_talons_buff 194879)
	SpellInfo(icy_talons_buff duration=6 max_stacks=3)
Define(inexorable_assault 253595)
	SpellInfo(inexorable_assault max_stacks=5)
Define(killing_machine 51128)
Define(killing_machine_buff 51124)
	SpellInfo(killing_machine_buff duration=10)
Define(mark_of_blood 206940)
	SpellInfo(mark_of_blood runicpower=30 cd=6)
Define(mark_of_blood_debuff 206940)
	SpellInfo(mark_of_blood_debuff duration=15)
Define(marrowrend 195182)
	SpellInfo(marrowrend runes=2 runicpower=-20)
	SpellAddBuff(marrowrend bone_shield_buff=1)
Define(mind_freeze 47528)
	SpellInfo(mind_freeze cd=15 gcd=0 interrupt=1 offgcd=1)
Define(obliterate 49020)
	SpellInfo(obliterate runes=2 runicpower=-20)
	SpellAddBuff(obliterate killing_machine_buff=0)
	SpellAddBuff(obliterate inexorable_assault=0 talent=inexorable_assault_talent)
Define(outbreak 77575)
	SpellInfo(outbreak runicpower=-10 runes=1)
	SpellAddTargetDebuff(outbreak virulent_plague_debuff=1)
	SpellAddTargetDebuff(outbreak outbreak_debuff=1)
Define(outbreak_debuff 196782)
	SpellInfo(outbreak_debuff duration=6)
Define(ossuary_buff 219788)
Define(path_of_frost 3714)
Define(pillar_of_frost 51271)
	SpellInfo(pillar_of_frost cd=45)
	SpellAddBuff(pillar_of_frost pillar_of_frost_buff=1)
Define(pillar_of_frost_buff 51271)
	SpellInfo(pillar_of_frost duration=15)
Define(raise_ally 61999)
Define(raise_dead 46584)
	SpellInfo(raise_dead cd=30)
Define(razorice_debuff 51714)
Define(remorseless_winter 196770)
	SpellInfo(remorseless_winter cd=20 runes=1 runicpower=-10)
Define(remorseless_winter_buff 196770)
	SpellInfo(remorseless_winter_buff duration=8)
Define(remorseless_winter_debuff 211793)
Define(rime_buff 59052)
	SpellInfo(rime_buff duration=15)
Define(rune_strike 210764)
	SpellInfo(rune_strike cd=60 max_charges=2 rune=-1)
Define(rune_tap 194679)
	SpellInfo(rune_tap cd=25 max_charges=2)
	SpellAddBuff(rune_tap rune_tap_buff=1)
Define(rune_tap_buff 194679)
	SpellInfo(rune_tap_buff duration=4)
Define(runic_corruption_buff 51460)
	SpellInfo(runic_corruption_buff duration=3) #TODO Increase rune generation rate
Define(scourge_strike 55090)
	SpellInfo(scourge_strike runes=1 runicpower=-10)
	SpellInfo(scourge_strike replace=clawing_shadows talent=clawing_shadows_talent)
Define(soul_reaper 130736)
	SpellInfo(soul_reaper runes=-2 cd=45)
	SpellAddTargetDebuff(soul_reaper soul_reaper_debuff=1)
Define(soul_reaper_debuff 130736)
	SpellInfo(soul_reaper_debuff duration=5)
Define(sudden_doom 49530)
Define(sudden_doom_buff 81340)
	SpellInfo(sudden_doom_buff duration=10)
	SpellInfo(sudden_doom_buff max_stacks=2 talent=harbinger_of_doom_talent)
Define(summon_gargoyle 49206)
	SpellInfo(summon_gargoyle cd=180)
Define(tombstone 219809)
	SpellInfo(tombstone cd=60)
	SpellAddBuff(tombstone bone_shield_buff=-5)
Define(unholy_blight 115989)
	SpellInfo(unholy_blight rune=1 runicpower=-10 cd=45)
	SpellAddBuff(unholy_blight unholy_blight_buff=1)
Define(unholy_blight_buff 115989)
	SpellInfo(unholy_blight duration=6)
Define(unholy_blight_debuff 115989)
	SpellInfo(unholy_blight_debuff duration=14 tick=2)
Define(unholy_frenzy 207289)
	SpellInfo(unholy_frenzy cd=78)
	SpellAddBuff(unholy_frenzy unholy_frenzy_buff)
Define(unholy_frenzy_buff 207289)
	SpellInfo(unholy_frenzy_buff duration=12)
Define(vampiric_blood 55233)
	SpellInfo(vampiric_blood cd=90 gcd=0 offgcd=1)
	SpellAddBuff(vampiric_blood vampiric_blood_buff=1)
Define(vampiric_blood_buff 55233)
	SpellInfo(vampiric_blood_buff duration=10)
Define(virulent_plague_debuff 191587)
	SpellInfo(virulent_plague_debuff duration=30 tick=3)
	SpellInfo(virulent_plague_debuff duration=15 tick=1.5 talent=ebon_fever_talent)
Define(voracius_buff 274009)
	SpellInfo(voracius_buff duration=6)
Define(wraith_walk 212552)
	SpellInfo(wraith_walk cd=60 unusable=1)
	SpellInfo(wraith_walk unusable=0 talent=wraith_walk_talent specialization=!blood)
	SpellInfo(wraith_walk unusable=0 talent=wraith_walk_talent_blood specialization=blood)
	SpellAddBuff(wraith_walk wraith_walk_buff=1)
Define(wraith_walk_buff 212552)
	SpellInfo(wraith_walk_buff duration=4)

## Items
Define(consorts_cold_core 144293)
Define(koltiras_newfound_will 132366)
Define(lanathels_lament 133974)
Define(lanathels_lament_buff 212975)
	SpellAddBuff(defile lanathels_lament_buff=1 if_equipped=lanathels_lament)
	SpellAddBuff(death_and_decay lanathels_lament_buff=1 if_equipped=lanathels_lament)
Define(perseverance_of_the_ebon_martyr 132459)
Define(perseverance_of_the_ebon_martyr_debuff 216059)

## Tier Items
# T20
SpellAddBuff(blood_boil gravewarden_buff=1 itemset=T20 itemcount=2)
Define(gravewarden_buff 242010) 
	SpellInfo(gravewarden_buff duration=10)

# Talents
Define(all_will_serve_talent 2)
Define(antimagic_barrier_talent 11)
Define(army_of_the_damned_talent 19)
Define(asphyxiate_talent 8)
Define(asphyxiate_talent_unholy 9)
Define(avalanche_talent 10)
Define(blinding_sleet_talent 9)
Define(blooddrinker_talent 2)
Define(bloodworms_talent 17)
Define(bonestorm_talent 21)
Define(breath_of_sindragosa_talent 21)
Define(bursting_sores_talent 4)
Define(clawing_shadows_talent 3)
Define(cold_heart_talent 3)
Define(consumption_talent 6)
Define(death_pact_talent 15)
Define(deaths_reach_talent 7)
Define(deaths_reach_talent_unholy 8)
Define(defile_talent 17)
Define(ebon_fever_talent 5)
Define(epidemic_talent 18)
Define(foul_bulwark_talent 7)
Define(frostscythe_talent 12)
Define(frostwyrms_fury_talent 18)
Define(frozen_pulse_talent 11)
Define(gathering_storm_talent 16)
Define(glacial_advance_talent 17)
Define(grip_of_the_dead_talent 13)
Define(grip_of_the_dead_talent_unholy 7)
Define(harbinger_of_doom_talent 11)
Define(heartbreaker_talent 1)
Define(hemostasis_talent 5)
Define(horn_of_winter_talent 6)
Define(icecap_talent 19)
Define(icy_talons_talent 2)
Define(inexorable_assault_talent 1)
Define(infected_claws_talent 1)
Define(mark_of_blood_talent 18)
Define(murderous_efficiency_talent 5)
Define(obliteration_talent 20)
Define(ossuary_talent 8)
Define(permafrost_talent 13)
Define(pestilence_talent 16)
Define(pestilent_pustules_talent 10)
Define(purgatory_talent 19)
Define(rapid_decomposition_talent 4)
Define(red_thirst_talent 20)
Define(rune_strike_talent 3)
Define(rune_tap_talent 12)
Define(runic_attenuation_talent 4)
Define(soul_reaper_talent 12)
Define(spell_eater_talent 13)
Define(summon_gargoyle_talent 21)
Define(tightening_grasp_talent 14)
Define(tombstone_talent 9)
Define(unholy_blight_talent 6)
Define(unholy_frenzy_talent 20)
Define(voracious_talent 16)
Define(will_of_the_necropolis_talent 10)
Define(wraith_walk_talent_blood 15)
Define(wraith_walk_talent 14)

# Non-default tags for OvaleSimulationCraft.
	SpellInfo(blood_tap tag=main)
	SpellInfo(outbreak tag=main)
`;
    OvaleScripts.RegisterScript("DEATHKNIGHT", undefined, name, desc, code, "include");
}
