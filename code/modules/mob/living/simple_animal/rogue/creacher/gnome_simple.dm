

/mob/living/simple_animal/hostile/rogue/gnome
	icon = 'icons/roguetown/mob/monster/gnome.dmi'
	name = "gnome"
	desc = "A mischievous, and diminuative, servant of graggar."
	icon_state = "gnome_simple"
	icon_living = "gnome_simple"
	icon_dead = "gnome_simple_dead"
	gender = MALE
	mob_biotypes = MOB_ORGANIC|MOB_HUMANOID
	robust_searching = 1
	speak_chance = 5
	turns_per_move = 1
	move_to_delay = 1
	STASTR = 6
	STASPD = 8
	STACON = 8
	STAEND = 6
	STAINT = 10
	maxHealth = 90
	health = 90
	harm_intent_damage = 15
	melee_damage_lower = 13
	melee_damage_upper = 15
	vision_range = 7
	aggro_vision_range = 9
	retreat_distance = 0
	minimum_distance = 0
	limb_destroyer = 1
	base_intents = list(/datum/intent/simple/stab)
	attack_verb_continuous = "stabs"
	attack_verb_simple = "stab"
	attack_sound = 'sound/blank.ogg'
	canparry = TRUE
	d_intent = INTENT_PARRY
	speak_emote = list("cackles")
	speak = list("Bleed their knees!")
	loot = list(/obj/effect/mob_spawn/human/gnome_simple/corpse,
			/obj/item/rogueweapon/knife/dagger/steel,
			/obj/effect/decal/cleanable/blood)
	faction = list("orcs")
	footstep_type = FOOTSTEP_MOB_SHOE
	del_on_death = TRUE

	can_have_ai = FALSE //disable native ai
	AIStatus = AI_OFF
	ai_controller = /datum/ai_controller/orc


/mob/living/simple_animal/hostile/rogue/gnome/get_sound(input)
	switch(input)
		if("aggro")
			return pick('sound/vo/mobs/simple_orcs/orc_yell.ogg','sound/vo/mobs/simple_orcs/orc_yell2.ogg','sound/vo/mobs/simple_orcs/orc_yell3.ogg', 'sound/vo/mobs/simple_orcs/orc_yell4.ogg')
		if("pain")
			return pick('sound/vo/mobs/simple_orcs/orc_pain.ogg','sound/vo/mobs/simple_orcs/orc_pain2.ogg','sound/vo/mobs/simple_orcs/orc_pain3.ogg', 'sound/vo/mobs/simple_orcs/orc_pain4.ogg')
		if("death")
			return pick('sound/vo/mobs/simple_orcs/orc_death.ogg','sound/vo/mobs/simple_orcs/orc_death2.ogg','sound/vo/mobs/simple_orcs/orc_death3.ogg','sound/vo/mobs/simple_orcs/orc_death4.ogg','sound/vo/mobs/simple_orcs/orc_death5.ogg',
			'sound/vo/mobs/simple_orcs/orc_death6.ogg')
		if("idle")
			return pick('sound/vo/mobs/simple_orcs/orc_idle.ogg','sound/vo/mobs/simple_orcs/orc_idle2.ogg','sound/vo/mobs/simple_orcs/orc_idle3.ogg','sound/vo/mobs/simple_orcs/orc_idle4.ogg')

/mob/living/simple_animal/hostile/rogue/gnome/Life()
	. = ..()
	if(!target)
		if(prob(3))
			emote(pick("idle"), TRUE)

/mob/living/simple_animal/hostile/rogue/gnome/taunted(mob/user)
	emote("aggro")
	GiveTarget(user)
	return

/mob/living/simple_animal/hostile/rogue/gnome/simple_limb_hit(zone)
	if(!zone)
		return ""
	switch(zone)
		if(BODY_ZONE_PRECISE_R_EYE)
			return "head"
		if(BODY_ZONE_PRECISE_L_EYE)
			return "head"
		if(BODY_ZONE_PRECISE_NOSE)
			return "nose"
		if(BODY_ZONE_PRECISE_MOUTH)
			return "mouth"
		if(BODY_ZONE_PRECISE_SKULL)
			return "head"
		if(BODY_ZONE_PRECISE_EARS)
			return "head"
		if(BODY_ZONE_PRECISE_NECK)
			return "neck"
		if(BODY_ZONE_PRECISE_L_HAND)
			return "hand"
		if(BODY_ZONE_PRECISE_R_HAND)
			return "hand"
		if(BODY_ZONE_PRECISE_L_FOOT)
			return "foot"
		if(BODY_ZONE_PRECISE_R_FOOT)
			return "foot"
		if(BODY_ZONE_PRECISE_STOMACH)
			return "stomach"
		if(BODY_ZONE_PRECISE_GROIN)
			return "groin"
		if(BODY_ZONE_HEAD)
			return "head"
		if(BODY_ZONE_R_LEG)
			return "leg"
		if(BODY_ZONE_L_LEG)
			return "leg"
		if(BODY_ZONE_R_ARM)
			return "arm"
		if(BODY_ZONE_L_ARM)
			return "arm"
	return ..()
