/obj/effect/landmark/mapGenerator/dakka/forest
	mapGeneratorType = /datum/mapGenerator/dforest
	endTurfX = 155
	endTurfY = 155
	startTurfX = 1
	startTurfY = 1

/datum/mapGenerator/dforest
	modules = list(/datum/mapGeneratorModule/dambushing,/datum/mapGeneratorModule/dforestgrassturf,/datum/mapGeneratorModule/dforest,/datum/mapGeneratorModule/dforestroad,/datum/mapGeneratorModule/dforestgrass,/datum/mapGeneratorModule/dforestwaterturf)

/datum/mapGeneratorModule/dforest
	clusterCheckFlags = CLUSTER_CHECK_DIFFERENT_ATOMS
	allowed_turfs = list(/turf/open/floor/rogue/dirt)
	excluded_turfs = list(/turf/open/floor/rogue/dirt/road)
	spawnableAtoms = list(/obj/structure/flora/newtree = 5,
							/obj/structure/flora/roguegrass/bush_meagre = 6,
							/obj/structure/flora/roguegrass = 100,
							/obj/structure/flora/roguegrass/pyroclasticflowers = 1,
							/obj/item/natural/stone = 5,
							/obj/item/natural/rock = 6,
							/obj/item/grown/log/tree/stick = 5,
							/obj/structure/chair/bench/ancientlog = 3,
							/obj/structure/table/wood/treestump = 4,
							/obj/structure/closet/dirthole/closed/loot=6,
							/obj/item/restraints/legcuffs/beartrap/armed/camouflage=0,
							/obj/structure/flora/roguegrass/maneater/real=0)
	spawnableTurfs = list(/turf/open/floor/rogue/dirt/road=80,
						/turf/open/water/swamp=25)
	allowed_areas = list(/area/rogue/outdoors/woods)

/datum/mapGeneratorModule/dforestroad
	clusterCheckFlags = CLUSTER_CHECK_DIFFERENT_ATOMS
	allowed_turfs = list(/turf/open/floor/rogue/dirt/road)
	spawnableAtoms = list(/obj/item/natural/stone = 3,/obj/item/grown/log/tree/stick = 2)

/datum/mapGeneratorModule/dforestgrassturf
	clusterCheckFlags = CLUSTER_CHECK_NONE
	allowed_turfs = list(/turf/open/floor/rogue/dirt)
	excluded_turfs = list(/turf/open/floor/rogue/dirt/road)
	spawnableTurfs = list(/turf/open/floor/rogue/grass = 200)
	allowed_areas = list(/area/rogue/outdoors/woods)

/datum/mapGeneratorModule/dforestgrass
	clusterCheckFlags = CLUSTER_CHECK_SAME_ATOMS
	allowed_turfs = list(/turf/open/floor/rogue/grass)
	excluded_turfs = list()
	allowed_areas = list(/area/rogue/outdoors/woods)
	spawnableAtoms = list(/obj/structure/flora/roguetree = 0,
							/obj/structure/flora/roguegrass/bush_meagre = 6,
							/obj/structure/flora/roguegrass = 120,
							/obj/structure/flora/roguegrass/maneater = 0,
							/obj/structure/flora/roguegrass/maneater/real = 0,
							/obj/item/restraints/legcuffs/beartrap/armed/camouflage = 0,
							/obj/item/natural/stone = 6,
							/obj/item/natural/rock = 5,
							/obj/item/grown/log/tree/stick = 3,
							/obj/structure/chair/bench/ancientlog = 5)

/datum/mapGeneratorModule/dforestwaterturf
	clusterCheckFlags = CLUSTER_CHECK_SAME_ATOMS
	allowed_turfs = list(/turf/open/water/cleanshallow)
	excluded_turfs = list()
	allowed_areas = list(/area/rogue/outdoors/woods)
	spawnableAtoms = list(/obj/structure/flora/roguegrass/water = 20,
	                        /obj/structure/flora/roguegrass/water/reeds = 30,
	                        /obj/structure/kneestingers = 55)
