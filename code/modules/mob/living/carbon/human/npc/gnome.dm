/mob/living/carbon/human/species/gnome
	name = "gnome"

	icon = 'icons/roguetown/mob/monster/gnome.dmi'
	icon_state = "gnome"
	race = /datum/species/gnome
	gender = MALE
	bodyparts = list(/obj/item/bodypart/chest/gnome, /obj/item/bodypart/head/gnome, /obj/item/bodypart/l_arm/gnome,
					/obj/item/bodypart/r_arm/gnome, /obj/item/bodypart/r_leg/gnome, /obj/item/bodypart/l_leg/gnome)
	rot_type = /datum/component/rot/corpse/gnome
	var/gnome_outfit = /datum/outfit/job/roguetown/npc/gnome
	ambushable = FALSE
	base_intents = list(INTENT_HELP, INTENT_DISARM, INTENT_GRAB, INTENT_HARM)
	possible_rmb_intents = list()
	vitae_pool = 250 // Small, frail creechers with not so much vitality to gain from.

/datum/species/gnome/after_creation(mob/living/carbon/C)
	..()
	C.grant_language(/datum/language/orcish)
	to_chat(C, "<span class='info'>I can speak Orcish with ,g before my speech.</span>")

/datum/species/gnome/on_species_loss(mob/living/carbon/C)
	. = ..()
	UnregisterSignal(C, COMSIG_MOB_SAY)
	C.remove_language(/datum/language/orcish)

/mob/living/carbon/human/species/gnome/npc
	aggressive=1
	mode = AI_IDLE
	dodgetime = 30 //they can dodge easily, but have a cooldown on it
	flee_in_pain = TRUE

	wander = FALSE

/mob/living/carbon/human/species/gnome/npc/ambush

	wander = TRUE


/obj/item/bodypart/chest/gnome
	dismemberable = 0
/obj/item/bodypart/l_arm/gnome
	dismemberable = 0
/obj/item/bodypart/r_arm/gnome
	dismemberable = 0
/obj/item/bodypart/r_leg/gnome
	dismemberable = 0
/obj/item/bodypart/l_leg/gnome
	dismemberable = 0

/obj/item/bodypart/head/gnome/update_icon_dropped()
	return

/obj/item/bodypart/head/gnome/get_limb_icon(dropped, hideaux = FALSE)
	return

/obj/item/bodypart/head/gnome/skeletonize()
	. = ..()
	icon_state = "gnome_skel_head"
	sellprice = 1



/datum/species/gnome
	name = "gnome"
	id = "gnome"
	species_traits = list(NO_UNDERWEAR,NOEYESPRITES)
	inherent_traits = list(TRAIT_NOROGSTAM,TRAIT_RESISTCOLD,TRAIT_RESISTHIGHPRESSURE,TRAIT_RESISTLOWPRESSURE,TRAIT_RADIMMUNE, TRAIT_EASYDISMEMBER, TRAIT_CRITICAL_WEAKNESS, TRAIT_NASTY_EATER, TRAIT_LEECHIMMUNE, TRAIT_INHUMENCAMP)
	nojumpsuit = 1
	sexes = 1
	offset_features = list(OFFSET_HANDS = list(0,-4), OFFSET_HANDS_F = list(0,-4))
	damage_overlay_type = ""
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_MAGIC | MIRROR_PRIDE | ERT_SPAWN | RACE_SWAP | SLIME_EXTRACT
	var/raceicon = "gnome"

/datum/species/gnome/regenerate_icons(mob/living/carbon/human/H)
//	H.cut_overlays()
	H.icon_state = ""
	if(H.notransform)
		return 1
	H.update_inv_hands()
	H.update_inv_handcuffed()
	H.update_inv_legcuffed()
	H.update_fire()
	H.update_body()
	var/mob/living/carbon/human/species/gnome/G = H
	G.update_wearable()
	H.update_transform()
	return TRUE

/mob/living/carbon/human/species/gnome/update_body()
	remove_overlay(BODY_LAYER)
	if(!dna || !dna.species)
		return
	var/datum/species/gnome/G = dna.species
	if(!istype(G))
		return
	icon_state = ""
	var/list/standing = list()
	var/mutable_appearance/body_overlay
	var/obj/item/bodypart/chesty = get_bodypart("chest")
	var/obj/item/bodypart/headdy = get_bodypart("head")
	if(!headdy)
		if(chesty && chesty.skeletonized)
			body_overlay = mutable_appearance(icon, "gnome_skel_decap", -BODY_LAYER)
		else
			body_overlay = mutable_appearance(icon, "[G.raceicon]_decap", -BODY_LAYER)
	else
		if(chesty && chesty.skeletonized)
			body_overlay = mutable_appearance(icon, "gnome_skel", -BODY_LAYER)
		else
			body_overlay = mutable_appearance(icon, "[G.raceicon]", -BODY_LAYER)

	if(body_overlay)
		standing += body_overlay
	if(standing.len)
		overlays_standing[BODY_LAYER] = standing

	apply_overlay(BODY_LAYER)
	dna.species.update_damage_overlays()

/mob/living/carbon/human/species/gnome/proc/update_wearable()
	remove_overlay(ARMOR_LAYER)

	var/list/standing = list()
	var/mutable_appearance/body_overlay
	if(wear_armor)
		body_overlay = mutable_appearance(icon, "[wear_armor.item_state]", -ARMOR_LAYER)
		if(body_overlay)
			standing += body_overlay
	if(head)
		body_overlay = mutable_appearance(icon, "[head.item_state]", -ARMOR_LAYER)
		if(body_overlay)
			standing += body_overlay
	if(standing.len)
		overlays_standing[ARMOR_LAYER] = standing

	apply_overlay(ARMOR_LAYER)

/mob/living/carbon/human/species/gnome/update_inv_head()
	update_wearable()
/mob/living/carbon/human/species/gnome/update_inv_armor()
	update_wearable()

/datum/species/gnome/update_damage_overlays(mob/living/carbon/human/H)
	return

/mob/living/carbon/human/species/gnome/Initialize()
	. = ..()
	addtimer(CALLBACK(src, PROC_REF(after_creation)), 1 SECONDS)

/mob/living/carbon/human/species/gnome/handle_combat()
	if(mode == AI_HUNT)
		if(prob(2))
			emote("laugh")
	. = ..()

/mob/living/carbon/human/species/gnome/after_creation()
	..()
	gender = MALE
	QDEL_NULL(sexcon)
	if(src.dna && src.dna.species)
		src.dna.species.soundpack_m = new /datum/voicepack/goblin()
		src.dna.species.soundpack_f = new /datum/voicepack/goblin()
		var/obj/item/headdy = get_bodypart("head")
		if(headdy)
			headdy.icon = 'icons/roguetown/mob/monster/gnome.dmi'
			headdy.icon_state = "[src.dna.species.id]_head"
			headdy.sellprice = rand(5,15)
	var/obj/item/organ/eyes/eyes = src.getorganslot(ORGAN_SLOT_EYES)
	if(eyes)
		eyes.Remove(src,1)
		QDEL_NULL(eyes)
	eyes = new /obj/item/organ/eyes/night_vision/nightmare
	eyes.Insert(src)
	src.underwear = "Nude"
	if(src.charflaw)
		QDEL_NULL(src.charflaw)
	update_body()
	faction = list("orcs")
	name = "gnome"
	real_name = "gnome"
	ADD_TRAIT(src, TRAIT_NOMOOD, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOHUNGER, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOROGSTAM, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_CRITICAL_WEAKNESS, TRAIT_GENERIC)
//	ADD_TRAIT(src, TRAIT_NOBREATH, TRAIT_GENERIC)
//	blue breathes underwater, need a new specific one for this maybe organ cheque
//	ADD_TRAIT(src, TRAIT_TOXIMMUNE, TRAIT_GENERIC)
	equipOutfit(new /datum/outfit/job/roguetown/npc/gnome)

/datum/component/rot/corpse/gnome/process()
	var/amt2add = 10 //1 second
	if(last_process)
		amt2add = ((world.time - last_process)/10) * amt2add
	last_process = world.time
	amount += amt2add
	var/mob/living/carbon/C = parent
	if(!C)
		qdel(src)
		return
	if(C.stat != DEAD)
		qdel(src)
		return
	var/should_update = FALSE
	if(amount > 20 MINUTES)
		for(var/obj/item/bodypart/B in C.bodyparts)
			if(!B.skeletonized)
				B.skeletonized = TRUE
				should_update = TRUE
	else if(amount > 12 MINUTES)
		for(var/obj/item/bodypart/B in C.bodyparts)
			if(!B.rotted)
				B.rotted = TRUE
				should_update = TRUE
			if(B.rotted)
				var/turf/open/T = C.loc
				if(istype(T))
					T.add_pollutants(/datum/pollutant/rot, 1)
	if(should_update)
		if(amount > 20 MINUTES)
			C.update_body()
			qdel(src)
			return
		else if(amount > 12 MINUTES)
			C.update_body()

/////////////////////////////////////////////////////////////////////////

/datum/outfit/job/roguetown/npc/gnome/pre_equip(mob/living/carbon/human/H)
	..()
	H.STASTR = 6
	H.STASPD = 8
	H.STACON = 8
	H.STAEND = 6
	H.STAINT = 10
	H.facial_hairstyle = "gnomebeard"
	var/loadout = rand(1,4)
	switch(loadout)
		if(1) //blades
			if(prob(50))
				r_hand = /obj/item/rogueweapon/sword/coppermesser
			else
				if(prob(50))
					r_hand = /obj/item/rogueweapon/sword/short/iron
				else
					r_hand = /obj/item/rogueweapon/knife/dagger/steel
			if(prob(25))
				l_hand = /obj/item/rogueweapon/shield/tower/buckleriron

			if(prob(50))
				head = /obj/item/clothing/head/roguetown/helmet/leather/fungi
			else
				head = /obj/item/clothing/head/roguetown/helmet/leather/gnomehat
			shirt = /obj/item/clothing/suit/roguetown/shirt/robe/gnome/blue
			shoes = /obj/item/clothing/shoes/roguetown/shortboots
		if(2) //blunt
			if(prob(50))
				r_hand = /obj/item/rogueweapon/polearm/woodstaff/quarterstaff/iron
			else
				r_hand = /obj/item/rogueweapon/mace
			if(prob(25))
				l_hand = /obj/item/rogueweapon/shield/tower/buckleriron

			if(prob(50))
				head = /obj/item/clothing/head/roguetown/helmet/leather/fungi
			else
				head = /obj/item/clothing/head/roguetown/helmet/leather/gnomehat

			shirt = /obj/item/clothing/suit/roguetown/shirt/robe/gnome/blue2
			shoes = /obj/item/clothing/shoes/roguetown/sandals

		if(3) //heavy armor
			r_hand = /obj/item/rogueweapon/sword/short/iron

			if(prob(90))
				l_hand = /obj/item/rogueweapon/shield/tower/buckleriron
			else
				l_hand = /obj/item/rogueweapon/knife/dagger/steel

			head = /obj/item/clothing/suit/roguetown/armor/cuirass/iron/gnome
			armor = /obj/item/clothing/head/roguetown/helmet/gnomespike
			shoes = /obj/item/clothing/shoes/roguetown/shortboots

		if(3) //elite
			r_hand = /obj/item/rogueweapon/sword/short
			l_hand = /obj/item/rogueweapon/shield/tower/buckleriron
			head = /obj/item/clothing/suit/roguetown/armor/cuirass/iron/gnome
			armor = /obj/item/clothing/head/roguetown/helmet/gnomespike
			shoes = /obj/item/clothing/shoes/roguetown/shortboots
