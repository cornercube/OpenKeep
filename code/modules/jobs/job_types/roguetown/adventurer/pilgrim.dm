/datum/job/roguetown/pilgrim
	title = "Pilgrim"
	flag = ADVENTURER
	department_flag = PEASANTS
	faction = "Station"
	total_positions = -1
	spawn_positions = 20
	allowed_races = ALL_PLAYER_RACES_BY_NAME
	tutorial = "Pilgrims begin far outside of the town and must reach it in order to ply their various trades. Sometimes, they build their own settlements and enjoy the terrible nature."

	outfit = null
	outfit_female = null
	bypass_jobban = FALSE
	advclass_cat_rolls = list(CTAG_PILGRIM = 15)

	display_order = JDO_PILGRIM
	min_pq = -20
	always_show_on_latechoices = TRUE
	same_job_respawn_delay = 0
	bypass_lastclass = TRUE


/datum/job/roguetown/pilgrim/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	..()
	if(L)
		var/mob/living/carbon/human/H = L
		H.advsetup = 1
		H.invisibility = INVISIBILITY_MAXIMUM
		H.become_blind("advsetup")
