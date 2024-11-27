/obj/item/clothing/suit/roguetown/armor/cuirass/iron/gnome
	name = "gnome plate"
	desc = "iron armor of gnomish make. It has finer fit and finish than typical goblin or orcish armor."
	icon = 'icons/roguetown/mob/monster/gnome.dmi'
	icon_state = "gnome_armor_item"
	item_state = "gnome_armor"
	slot_flags = ITEM_SLOT_ARMOR|ITEM_SLOT_SHIRT
	allowed_race = list("gnome")
	bloody_icon_state = "bodyblood"
	boobed = TRUE
	anvilrepair = TRUE
	smeltresult = /obj/item/ingot/iron
	armor_class = AC_MEDIUM
	armor = ARMOR_MAILLE
	body_parts_covered = COVERAGE_ALL_BUT_LEGS
	prevent_crits = ALL_EXCEPT_BLUNT
	max_integrity = INTEGRITY_STRONG

/obj/item/clothing/suit/roguetown/shirt/gnome
	name = "gnome robe"
	desc = "the garb of a gnome."
	icon = 'icons/roguetown/mob/monster/gnome.dmi'
	slot_flags = ITEM_SLOT_SHIRT
	anvilrepair = null
	smeltresult = /obj/item/ash
	icon_state = "gnome_robe_item"
	item_state = "gnome_robe"
	allowed_race = list("gnome")

/obj/item/clothing/suit/roguetown/shirt/gnome/blue
	icon_state = "grobe_c_item"
	item_state = "grobe_c"

/obj/item/clothing/suit/roguetown/shirt/gnome/green
	icon_state = "grobe_a_item"
	item_state = "grobe_a"


/obj/item/clothing/suit/roguetown/shirt/gnome/bog
	desc = "the garb of a bog gnome."
	icon_state = "gnome_robe_bog_item"
	item_state = "gnome_robe_bog"

//////////////////////////////////////////////

/obj/item/clothing/head/roguetown/helmet/leather/fungi
	name = "fungi helm"
	desc = "a helmet in the shape of an enormous mushroom. It's sheer bulk provides some protection."
	icon = 'icons/roguetown/mob/monster/gnome.dmi'
	icon_state = "fungi_helm_item"
	item_state = "fungi_helm"
	allowed_race = list("gnome")

/obj/item/clothing/head/roguetown/helmet/leather/fungi/bog
	icon_state = "fungi_helm_bog_item"
	item_state = "fungi_helm_bog"

/obj/item/clothing/head/roguetown/helmet/leather/gnomehat
	name = "gnome helm"
	desc = "a pointy hat made of a strange material. It is stiff enough to provide a bit of protection despite appearing flimsy to the touch. It is rather eyecatching." //made of plastic
	icon = 'icons/roguetown/mob/monster/gnome.dmi'
	icon_state = "gnome_helm_item"
	item_state = "gnome_helm"
	allowed_race = list("gnome")

/obj/item/clothing/head/roguetown/helmet/gnomespike
	name = "iron gnome helm"
	desc = "an iron cone worn as a helmet by gnomish elite warriors. Try not to fall on it"
	icon = 'icons/roguetown/mob/monster/gnome.dmi'
	icon_state = "spike_helm_item"
	item_state = "spike_helm"
	allowed_race = list("gnome")
	sellprice = VALUE_CHEAP_IRON_HELMET
	body_parts_covered = COVERAGE_NASAL
	max_integrity = INTEGRITY_POOR

