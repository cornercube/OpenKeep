// ===================================================================================
// -------------------		SKELLY SKILLED CORE		--------------------------
/datum/outfit/job/roguetown/species/skeleton/skilled/pre_equip(mob/living/carbon/human/H)
	..()
	H.STASTR = rand(6,8)
	H.STASPD = rand(8,10)
	H.STACON = rand(8,10)
	H.STAEND = 12
	H.STAINT = 1

/mob/living/carbon/human/species/skeleton/skilled/after_creation()
	..()
	configure_mind()
	ADD_TRAIT(src, TRAIT_CRITICAL_WEAKNESS, TRAIT_GENERIC)
	d_intent = INTENT_PARRY //these ones will parry instead of dodge, the higher the skill the more powerful this is of course
	aggressive = TRUE
	mode = AI_IDLE
	dodgetime = 2 SECONDS
	canparry = TRUE
	flee_in_pain = FALSE
	wander = TRUE
	ambushable = FALSE

/mob/living/carbon/human/species/skeleton/skilled/proc/configure_mind()
	if(!mind)
		mind = new /datum/mind(src)

	mind.adjust_skillrank(/datum/skill/combat/polearms, 2, TRUE)
	mind.adjust_skillrank(/datum/skill/combat/swords, 2, TRUE)
	mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
	mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
	mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
	mind.adjust_skillrank(/datum/skill/combat/axesmaces, 2, TRUE)
	mind.adjust_skillrank(/datum/skill/combat/shields, 1, TRUE)
	mind.adjust_skillrank(/datum/skill/combat/whipsflails, 2, TRUE)

// -------------------		UNARMED SKELLY		--------------------------
/mob/living/carbon/human/species/skeleton/skilled/unarmed
	name = "animated skeleton"

/mob/living/carbon/human/species/skeleton/skilled/unarmed/after_creation()
	..()
	equipOutfit(new /datum/outfit/job/roguetown/species/skeleton/skilled/unarmed)

/datum/outfit/job/roguetown/species/skeleton/skilled/unarmed/pre_equip(mob/living/carbon/human/H)
	..()
	if(prob(50))
		belt = /obj/item/storage/belt/rogue/leather/rope
	if(prob(50))
		shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/vagrant
	if(prob(50))
		shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/vagrant
	if(prob(50))
		shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/vagrant/l

	if(prob(50))
		pants = /obj/item/clothing/under/roguetown/tights/vagrant
	if(prob(50))
		pants = /obj/item/clothing/under/roguetown/tights/vagrant/l

	if(prob(20))
		r_hand = /obj/item/natural/stone
	if(prob(10))
		r_hand = /obj/item/rogueweapon/knife/stone
	if(prob(10))
		r_hand = /obj/item/rogueweapon/mace/woodclub

// -------------------		FIGHTER SKELLY		--------------------------
/mob/living/carbon/human/species/skeleton/skilled/fighter
	name = "animated skeleton"

/mob/living/carbon/human/species/skeleton/skilled/fighter/after_creation()
	..()
	equipOutfit(new /datum/outfit/job/roguetown/species/skeleton/skilled/fighter)

/mob/living/carbon/human/species/skeleton/skilled/fighter/configure_mind()
	if(!mind)
		mind = new /datum/mind(src)

	mind.adjust_skillrank(/datum/skill/combat/polearms, 3, TRUE)
	mind.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
	mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
	mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
	mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
	mind.adjust_skillrank(/datum/skill/combat/axesmaces, 3, TRUE)
	mind.adjust_skillrank(/datum/skill/combat/shields, 3, TRUE)
	mind.adjust_skillrank(/datum/skill/combat/whipsflails, 3, TRUE)

/datum/outfit/job/roguetown/species/skeleton/skilled/fighter/pre_equip(mob/living/carbon/human/H)
	..()
	H.STASTR = 10
	H.STACON = 11
	var/loadout = rand(1,3)
	if(prob(50))
		belt = /obj/item/storage/belt/rogue/leather/rope
	if(prob(50))
		belt = /obj/item/storage/belt/rogue/leather

	if(prob(50))
		shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/vagrant
	if(prob(50))
		shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/vagrant/l

	if(prob(50))
		pants = /obj/item/clothing/under/roguetown/tights/vagrant
	if(prob(50))
		pants = /obj/item/clothing/under/roguetown/tights/vagrant/l

	if(prob(50))
		wrists = /obj/item/clothing/wrists/roguetown/bracers/leather

	if(prob(30))
		armor = /obj/item/clothing/suit/roguetown/armor/chainmail/iron

	if(prob(30))
		armor = /obj/item/clothing/suit/roguetown/armor/leather

	if(prob(40))
		armor = /obj/item/clothing/suit/roguetown/armor/cuirass/iron/rust

	switch(loadout)
		if(1)
			r_hand = /obj/item/rogueweapon/sword/scimitar
			l_hand = /obj/item/rogueweapon/shield/wood
			head = /obj/item/clothing/head/roguetown/helmet/leather/conical
		if(2)
			r_hand = /obj/item/rogueweapon/mace
			l_hand = /obj/item/rogueweapon/shield/wood
			neck = /obj/item/clothing/neck/roguetown/coif
			head = /obj/item/clothing/head/roguetown/helmet/skullcap
		if(3)
			r_hand = /obj/item/rogueweapon/flail
			l_hand = /obj/item/rogueweapon/shield/wood
			neck = /obj/item/clothing/neck/roguetown/chaincoif


// ===================================================================================
// -------------------		ORC SKILLED CORE		--------------------------
/datum/outfit/job/roguetown/species/orc/skilled/pre_equip(mob/living/carbon/human/H)
	..()
	H.STASTR = 13
	H.STASPD = 9
	H.STACON = 13
	H.STAEND = 13
	H.STAINT = 6

/mob/living/carbon/human/species/orc/skilled/after_creation()
	..()
	configure_mind()
	d_intent = INTENT_PARRY //these ones will parry instead of dodge, the higher the skill the more powerful this is of course
	ADD_TRAIT(src, TRAIT_NOMOOD, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOHUNGER, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_CRITICAL_WEAKNESS, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_ZOMBIE_IMMUNE, TRAIT_GENERIC)
	aggressive = TRUE
	mode = AI_IDLE
	dodgetime = 2 SECONDS
	canparry = TRUE
	flee_in_pain = FALSE
	wander = TRUE
	ambushable = FALSE
	hair_color = "#1f1d1d"
	hairstyle = "Forsaken"

/mob/living/carbon/human/species/orc/skilled/configure_mind()
	if(!mind)
		mind = new /datum/mind(src)

	mind.adjust_skillrank(/datum/skill/combat/polearms, 2, TRUE)
	mind.adjust_skillrank(/datum/skill/combat/swords, 2, TRUE)
	mind.adjust_skillrank(/datum/skill/combat/wrestling, 4, TRUE)
	mind.adjust_skillrank(/datum/skill/combat/unarmed, 4, TRUE)
	mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
	mind.adjust_skillrank(/datum/skill/combat/axesmaces, 2, TRUE)
	mind.adjust_skillrank(/datum/skill/combat/shields, 2, TRUE)
	mind.adjust_skillrank(/datum/skill/combat/whipsflails, 2, TRUE)


/mob/living/carbon/human/species/orc/skilled/after_creation(mob/living/carbon/C)
	..()
	C.remove_all_languages()
	C.grant_language(/datum/language/orcish)
	to_chat(C, "<span class='info'>I can speak Orcish with ,g before my speech.</span>")


// -------------------		SAVAGE ORC		--------------------------
/mob/living/carbon/human/species/orc/skilled/savage
	name = "savage orc"

/mob/living/carbon/human/species/orc/skilled/savage/after_creation()
	..()
	equipOutfit(new /datum/outfit/job/roguetown/npc/orc/savage)

/datum/outfit/job/roguetown/npc/orc/savage/pre_equip(mob/living/carbon/human/H)
	..()
	if(prob(20))
		armor = /obj/item/clothing/suit/roguetown/armor/leather/hide/orc
	if(prob(20))
		pants =	/obj/item/clothing/under/roguetown/loincloth/brown
	if(prob(20))
		cloak = /obj/item/clothing/cloak/raincloak/brown
	if(prob(20))
		shoes = /obj/item/clothing/shoes/roguetown/boots/furlinedanklets
	if(prob(20))
		head = /obj/item/clothing/head/roguetown/helmet/leather

	var/loadout = rand(1,5)
	switch(loadout)
		if(1) //Dual Axe Warrior
			r_hand = /obj/item/rogueweapon/axe/stone
		if(2) //Long Club Caveman
			r_hand = /obj/item/rogueweapon/polearm/woodstaff
		if(3) //Club Caveman
			r_hand = /obj/item/rogueweapon/mace/woodclub
		if(4) //dagger fighter
			r_hand = /obj/item/rogueweapon/knife/stone
			l_hand = /obj/item/rogueweapon/knife/stone
		if(5) //Spear hunter
			r_hand = /obj/item/rogueweapon/polearm/spear/stone

// -------------------		SAVAGE ORC LOOTER		--------------------------
/mob/living/carbon/human/species/orc/skilled/looter
	name = "savage orc looter"

/mob/living/carbon/human/species/orc/skilled/looter/after_creation()
	..()
	equipOutfit(new /datum/outfit/job/roguetown/npc/orc/looter)

/datum/outfit/job/roguetown/npc/orc/looter/pre_equip(mob/living/carbon/human/H)
	..()
	if(prob(20))
		pants =	/obj/item/clothing/under/roguetown/loincloth/brown
	if(prob(20))
		pants = /obj/item/clothing/under/roguetown/trou/leather

	if(prob(20))
		shoes = /obj/item/clothing/shoes/roguetown/boots/furlinedanklets
	if(prob(20))
		head = /obj/item/clothing/head/roguetown/helmet/leather

	var/loadout = rand(1,4)
	switch(loadout)
		if(1)
			r_hand = /obj/item/rogueweapon/pick/paxe
			armor = /obj/item/clothing/suit/roguetown/armor/cuirass/iron
			head = /obj/item/clothing/head/roguetown/helmet/orc
		if(2)
			r_hand = /obj/item/rogueweapon/flail
			l_hand = /obj/item/rogueweapon/shield/wood
			armor = /obj/item/clothing/suit/roguetown/armor/leather/hide/orc
			head = /obj/item/clothing/head/roguetown/helmet/orc
		if(3)
			r_hand = /obj/item/rogueweapon/sword/scimitar/messer
			armor = /obj/item/clothing/suit/roguetown/armor/chainmail/iron
			head = /obj/item/clothing/head/roguetown/helmet/leather/minershelm
		if(4)
			r_hand = /obj/item/rogueweapon/mace/spiked
			l_hand = /obj/item/rogueweapon/shield/wood
			armor = /obj/item/clothing/suit/roguetown/armor/plate/orc
			head = /obj/item/clothing/head/roguetown/helmet/orc

// -------------------		SAVAGE ORC CHIEFTAIN		--------------------------
/mob/living/carbon/human/species/orc/skilled/savage_chieftain
	name = "savage orc chieftain"

/mob/living/carbon/human/species/orc/skilled/savage_chieftain/after_creation()
	..()
	equipOutfit(new /datum/outfit/job/roguetown/npc/orc/savage_chieftain)

/mob/living/carbon/human/species/orc/skilled/savage_chieftain/configure_mind()
	if(!mind)
		mind = new /datum/mind(src)

	mind.adjust_skillrank(/datum/skill/combat/polearms, 3, TRUE)
	mind.adjust_skillrank(/datum/skill/combat/swords, 4, TRUE)
	mind.adjust_skillrank(/datum/skill/combat/wrestling, 5, TRUE)
	mind.adjust_skillrank(/datum/skill/combat/unarmed, 5, TRUE)
	mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
	mind.adjust_skillrank(/datum/skill/combat/axesmaces, 4, TRUE)
	mind.adjust_skillrank(/datum/skill/combat/shields, 3, TRUE)
	mind.adjust_skillrank(/datum/skill/combat/whipsflails, 2, TRUE)

/datum/outfit/job/roguetown/npc/orc/savage_chieftain/pre_equip(mob/living/carbon/human/H)
	..()
	if(prob(20))
		pants =	/obj/item/clothing/under/roguetown/loincloth/brown
	if(prob(20))
		pants = /obj/item/clothing/under/roguetown/trou/leather

	if(prob(20))
		shoes = /obj/item/clothing/shoes/roguetown/boots/furlinedanklets
	if(prob(20))
		head = /obj/item/clothing/head/roguetown/helmet/leather

	var/loadout = rand(1,5)
	switch(loadout)
		if(1)
			r_hand = /obj/item/rogueweapon/mace/steel/morningstar
			l_hand = /obj/item/rogueweapon/sword/scimitar/messer
			armor = /obj/item/clothing/suit/roguetown/armor/chainmail/hauberk
			head = /obj/item/clothing/head/roguetown/helmet/orc/warlord
		if(2)
			r_hand = /obj/item/rogueweapon/sword/scimitar/falchion
			l_hand = /obj/item/rogueweapon/shield/tower
			armor = /obj/item/clothing/suit/roguetown/armor/plate/orc/warlord
			head = /obj/item/clothing/head/roguetown/helmet/orc/warlord
		if(3)
			r_hand = /obj/item/rogueweapon/flail/sflail
			l_hand = /obj/item/rogueweapon/shield/wood
			armor = /obj/item/clothing/suit/roguetown/armor/plate/orc/warlord
			head = /obj/item/clothing/head/roguetown/helmet/orc/warlord
		if(4)// WE DON'T WANNA GO TO WAR TODAY BUT THE LORD OF THE LASH SAYS "NAY NAY NAY!!" WE'RE GONNA MARCH ALL DAE, ALL DAE, ALL DAE! WHERE THERE'S A WHIP THERE'S A WAY!!
			r_hand = /obj/item/rogueweapon/whip/antique
			l_hand = /obj/item/rogueweapon/sword/short
			armor = /obj/item/clothing/suit/roguetown/armor/plate/orc/warlord
			head = /obj/item/clothing/head/roguetown/helmet/orc/warlord


// ===================================================================================
/*
/mob/living/carbon/human/species/human/northern/bum/skilled
	race = /datum/species/human/northern/npc

/datum/species/human/northern/npc
	armor = list("melee" = 3, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 10, "acid" = 0)
*/
/datum/outfit/job/roguetown/human_npc/skilled/pre_equip(mob/living/carbon/human/H)
	H.STASTR = rand(8,10)
	H.STASPD = rand(8,10)
	H.STACON = rand(8,10)
	H.STAEND = rand(8,10)
	H.STAINT = 7

/mob/living/carbon/human/species/human/northern/bum/skilled/after_creation()
	..()
	ADD_TRAIT(src, TRAIT_CRITICAL_WEAKNESS, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_ZOMBIE_IMMUNE, TRAIT_GENERIC)
	configure_mind()
	d_intent = INTENT_PARRY //these ones will parry instead of dodge, the higher the skill the more powerful this is of course
	aggressive = FALSE
	mode = AI_IDLE
	dodgetime = 4 SECONDS
	canparry = TRUE

	flee_in_pain = TRUE
	wander = FALSE
	ambushable = FALSE
	faction = list("bums", "station")

/mob/living/carbon/human/species/human/northern/bum/skilled/proc/configure_mind()
	if(!mind)
		mind = new /datum/mind(src)

	mind.adjust_skillrank(/datum/skill/combat/polearms, 2, TRUE)
	mind.adjust_skillrank(/datum/skill/combat/swords, 2, TRUE)
	mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
	mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
	mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
	mind.adjust_skillrank(/datum/skill/combat/axesmaces, 2, TRUE)
	mind.adjust_skillrank(/datum/skill/combat/shields, 2, TRUE)
	mind.adjust_skillrank(/datum/skill/combat/whipsflails, 2, TRUE)

// -------------------		BUM		--------------------------
/mob/living/carbon/human/species/human/northern/bum/skilled/madman/after_creation()
	..()
	job = "Beggar"
	aggressive= TRUE
	wander = FALSE


// -------------------		OUTLAW		--------------------------
/mob/living/carbon/human/species/human/northern/bum/skilled/outlaw/after_creation()
	..()
	job = "Beggar"
	aggressive= TRUE
	wander = TRUE
	equipOutfit(new /datum/outfit/job/roguetown/human_npc/skilled/outlaw)
	outlaw = TRUE	// just for the right say strings

/datum/outfit/job/roguetown/human_npc/skilled/outlaw
	name = "Outlaw"

/datum/outfit/job/roguetown/human_npc/skilled/outlaw/pre_equip(mob/living/carbon/human/H)
	..()
	H.STASTR = 10
	H.STAEND = 10

	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/vagrant
	if(prob(30))
		shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/vagrant/l
	if(prob(30))
		shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/random
	pants = /obj/item/clothing/under/roguetown/tights/random
	if(prob(30))
		pants = /obj/item/clothing/under/roguetown/tights/vagrant
	if(prob(30))
		pants = /obj/item/clothing/under/roguetown/tights/vagrant/l
	shoes = /obj/item/clothing/shoes/roguetown/simpleshoes
	if(prob(30))
		shoes = /obj/item/clothing/shoes/roguetown/boots
	if(prob(30))
		belt = /obj/item/storage/belt/rogue/leather/rope
		beltl = /obj/item/rogueweapon/knife/villager
	if(prob(10))
		belt = /obj/item/storage/belt/rogue/leather
		beltr = /obj/item/reagent_containers/powder/moondust
	if(prob(10))
		cloak = /obj/item/clothing/cloak/raincloak/brown
	if(prob(10))
		gloves = /obj/item/clothing/gloves/roguetown/fingerless
	if(prob(10))
		wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	if(prob(10))
		neck = /obj/item/storage/belt/rogue/pouch/coins/poor

	var/head = rand(1,6)
	switch(head)
		if(1)
			head = /obj/item/clothing/head/roguetown/knitcap
			mask = /obj/item/clothing/mask/rogue/shepherd
		if(2)
			head = /obj/item/clothing/head/roguetown/strawhat
			mask = /obj/item/clothing/mask/rogue/shepherd/rag
		if(3)
			head = /obj/item/clothing/head/roguetown/menacing
		if(4)
			head = /obj/item/clothing/head/roguetown/armingcap
		if(5)
			head = /obj/item/clothing/head/roguetown/helmet/leather
		if(6)
			head = /obj/item/clothing/head/roguetown/roguehood/uncolored

	var/armor = rand(1,5)
	switch(armor)
		if(1)
			armor = /obj/item/clothing/suit/roguetown/armor/gambeson/light
			pants = /obj/item/clothing/under/roguetown/trou/leather
		if(2)
			armor = /obj/item/clothing/suit/roguetown/shirt/rags
			pants = /obj/item/clothing/under/roguetown/trou/leather
		if(3)
			armor = /obj/item/clothing/suit/roguetown/armor/gambeson
		if(4)
			armor = /obj/item/clothing/suit/roguetown/armor/leather/vest
			neck = /obj/item/clothing/neck/roguetown/coif
		if(5)
			armor = /obj/item/clothing/suit/roguetown/armor/leather/jacket

	var/weapon = rand(1,6)
	switch(weapon)
		if(1)
			r_hand = /obj/item/rogueweapon/axe/iron
		if(2)
			r_hand = /obj/item/rogueweapon/polearm/halberd/bardiche/woodcutter/neu
		if(3)
			r_hand = /obj/item/rogueweapon/mace/cudgel/bludgeon
		if(4)
			r_hand =/obj/item/rogueweapon/pitchfork
		if(5)
			r_hand = /obj/item/rogueweapon/thresher/military
		if(6)
			r_hand = /obj/item/rogueweapon/sword/short/iron


// ===================================================================================
// -------------------		GOBLIN		--------------------------
/mob/living/carbon/human/species/goblin/skilled
	aggressive = TRUE
	mode = AI_IDLE
	dodgetime = 5 SECONDS
	flee_in_pain = TRUE
	canparry = TRUE
	wander = FALSE
	ambushable = FALSE

/mob/living/carbon/human/species/goblin/skilled/proc/configure_mind()
	if(!mind)
		mind = new /datum/mind(src)

	mind.adjust_skillrank(/datum/skill/combat/polearms, 2, TRUE)
	mind.adjust_skillrank(/datum/skill/combat/swords, 2, TRUE)
	mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
	mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
	mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
	mind.adjust_skillrank(/datum/skill/combat/axesmaces, 2, TRUE)
	mind.adjust_skillrank(/datum/skill/combat/shields, 2, TRUE)
	mind.adjust_skillrank(/datum/skill/combat/whipsflails, 2, TRUE)

/mob/living/carbon/human/species/goblin/skilled/after_creation()
	..()
	configure_mind()
	d_intent = INTENT_PARRY //these ones will parry instead of dodge, the higher the skill the more powerful this is of course
	ADD_TRAIT(src, TRAIT_ZOMBIE_IMMUNE, TRAIT_GENERIC)
	equipOutfit(new /datum/outfit/job/roguetown/npc/goblin)

/mob/living/carbon/human/species/goblin/skilled/moon
	name = "moon goblin"
	race = /datum/species/goblin/moon


/* 	Can be put into pre_equip to lessen chance of crits, bit strong despite the low value
	H.skin_armor = new /obj/item/clothing/suit/roguetown/armor/skin_armor/weak(H)

/obj/item/clothing/suit/roguetown/armor/skin_armor/weak // since NPCs using crit weakness this is a way to give them a slightly longer life by reducing chance of crits
	slot_flags = null
	name = ""
	desc = ""
	icon_state = null
	body_parts_covered = FULL_BODY
	armor = list("melee" = 3, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
*/


// ===================================================================================
/datum/intent/simple/trollsmash
	name = "trollsmash"
	icon_state = "instrike"
	attack_verb = list("hammer-punches", "smashes", "headbutts", "rams")
	animname = "blank22"
	blade_class = BCLASS_BLUNT
	hitsound = "punch_hard"
	chargetime = 0
	penfactor = 13
	swingdelay = 4 SECONDS
	candodge = TRUE
	canparry = FALSE

/*
/mob/living/simple_animal/hostile/retaliate/rogue/troll
	base_intents = list(/datum/intent/simple/trollrip, /datum/intent/simple/trollsmash)

/mob/living/simple_animal/hostile/retaliate/rogue/trollbog
	base_intents = list(/datum/intent/simple/trollsmash, /datum/intent/simple/trollrip)

/mob/living/simple_animal/hostile/retaliate/rogue/wolf
	base_intents = list(/datum/intent/simple/critterbite)

/mob/living/simple_animal/hostile/retaliate/rogue/bigrat
	base_intents = list(/datum/intent/simple/critterbite)
*/
/datum/intent/simple/trollrip
	name = "trollrip"
	icon_state = "instrike"
	attack_verb = list("claws", "gnashes", "viciously bites")
	animname = "blank22"
	blade_class = BCLASS_CHOP
	hitsound = "smallslash"
	chargetime = 0
	penfactor = 20
	swingdelay = 2 SECONDS
	candodge = TRUE
	canparry = TRUE

/datum/intent/simple/critterbite
	name = "bite"
	icon_state = "instrike"
	attack_verb = list("bites")
	animname = "blank22"
	blade_class = BCLASS_CUT
	hitsound = "smallslash"
	chargetime = 0
	penfactor = 5
	swingdelay = 1.5 SECONDS
	candodge = TRUE
	canparry = TRUE

/datum/intent/simple/claw_strong
	name = "claw"
	icon_state = "inclaw"
	attack_verb = list("slashes", "claws")
	animname = "blank22"
	blade_class = BCLASS_CUT
	hitsound = "smallslash"
	chargetime = 0
	penfactor = 5
	swingdelay = 2 SECONDS
	candodge = TRUE
	canparry = TRUE
	miss_text = "slashes the air!"

/datum/intent/simple/claw_quick
	name = "claw"
	icon_state = "inclaw"
	attack_verb = list("slashes", "claws")
	animname = "blank22"
	blade_class = BCLASS_CUT
	hitsound = "smallslash"
	chargetime = 0
	penfactor = 3
	swingdelay = 1 SECONDS
	candodge = TRUE
	canparry = TRUE
	miss_text = "slashes the air!"
