/////////////////////////
////// Mecha Parts //////
/////////////////////////

// Mecha circuitboards can be found in /code/game/objects/items/weapons/circuitboards/mecha.dm

/obj/item/mecha_parts
	name = "mecha part"
	icon = 'icons/mecha/mech_construct.dmi'
	icon_state = "blank"
	w_class = ITEM_SIZE_HUGE
	flags = CONDUCT
	origin_tech = list(TECH(T_DATA) = 2, TECH(T_MATERIAL) = 2)

/obj/item/mecha_parts/chassis
	name="Mecha Chassis"
	icon_state = "backbone"
	var/datum/construction/construct
	flags = CONDUCT

	attackby(obj/item/W as obj, mob/user as mob)
		if(!construct || !construct.action(W, user))
			..()
		return

	attack_hand()
		return

	initialize()
		if(ispath(construct))
			construct = new construct(src)
		. = ..()

/////////// Ripley

/obj/item/mecha_parts/chassis/ripley
	name = "Ripley Chassis"
	construct = /datum/construction/mecha/ripley_chassis

/obj/item/mecha_parts/part/ripley
	desc="A Ripley APLU left arm. Data and power sockets are compatible with most exosuit tools."
	origin_tech = list(TECH(T_DATA) = 2, TECH(T_MATERIAL) = 2, TECH(T_ENGINEERING) = 2)

/obj/item/mecha_parts/part/ripley/torso
	name="Ripley Torso"
	desc="A torso part of Ripley APLU. Contains power unit, processing core and life support systems."
	icon_state = "ripley_harness"
	origin_tech = list(TECH(T_DATA) = 2, TECH(T_MATERIAL) = 2, TECH(T_BIO) = 2, TECH(T_ENGINEERING) = 2)

/obj/item/mecha_parts/part/ripley/left_arm
	name="Ripley Left Arm"
	icon_state = "ripley_l_arm"

/obj/item/mecha_parts/part/ripley/right_arm
	name="Ripley Right Arm"
	icon_state = "ripley_r_arm"

/obj/item/mecha_parts/part/ripley/left_leg
	name="Ripley Left Leg"
	desc="A Ripley APLU left leg. Contains somewhat complex servodrives and balance maintaining systems."
	icon_state = "ripley_l_leg"

/obj/item/mecha_parts/part/ripley/right_leg
	name="Ripley Right Leg"
	desc="A Ripley APLU right leg. Contains somewhat complex servodrives and balance maintaining systems."
	icon_state = "ripley_r_leg"

///////// Gygax

/obj/item/mecha_parts/chassis/gygax
	name = "Gygax Chassis"
	construct = /datum/construction/mecha/gygax_chassis

/obj/item/mecha_parts/part/gygax
	desc="A Gygax left arm. Data and power sockets are compatible with most exosuit tools and weapons."
	origin_tech = list(TECH(T_DATA) = 2, TECH(T_MATERIAL) = 2, TECH(T_ENGINEERING) = 3)

/obj/item/mecha_parts/part/gygax/torso
	name="Gygax Torso"
	desc="A torso part of Gygax. Contains power unit, processing core and life support systems. Has an additional equipment slot."
	icon_state = "gygax_harness"
	origin_tech = list(TECH(T_DATA) = 2, TECH(T_MATERIAL) = 2, TECH(T_BIO) = 3, TECH(T_ENGINEERING) = 3)

/obj/item/mecha_parts/part/gygax/head
	name="Gygax Head"
	desc="A Gygax head. Houses advanced surveilance and targeting sensors."
	icon_state = "gygax_head"
	origin_tech = list(TECH(T_DATA) = 2, TECH(T_MATERIAL) = 2, TECH(T_MAGNET) = 3, TECH(T_ENGINEERING) = 3)

/obj/item/mecha_parts/part/gygax/left_arm
	name="Gygax Left Arm"
	icon_state = "gygax_l_arm"

/obj/item/mecha_parts/part/gygax/right_arm
	name="Gygax Right Arm"
	icon_state = "gygax_r_arm"

/obj/item/mecha_parts/part/gygax/left_leg
	name="Gygax Left Leg"
	icon_state = "gygax_l_leg"

/obj/item/mecha_parts/part/gygax/right_leg
	name="Gygax Right Leg"
	icon_state = "gygax_r_leg"

/obj/item/mecha_parts/part/gygax/armour
	name="Gygax Armour Plates"
	icon_state = "gygax_armor"
	origin_tech = list(TECH(T_MATERIAL) = 6, TECH(T_COMBAT) = 4, TECH(T_ENGINEERING) = 5)


//////////// Durand

/obj/item/mecha_parts/chassis/durand
	name = "Durand Chassis"
	construct = /datum/construction/mecha/durand_chassis

/obj/item/mecha_parts/part/durand
	origin_tech = list(TECH(T_DATA) = 2, TECH(T_MATERIAL) = 3, TECH(T_ENGINEERING) = 3)

/obj/item/mecha_parts/part/durand/torso
	name="Durand Torso"
	icon_state = "durand_harness"
	origin_tech = list(TECH(T_DATA) = 2, TECH(T_MATERIAL) = 3, TECH(T_BIO) = 3, TECH(T_ENGINEERING) = 3)

/obj/item/mecha_parts/part/durand/head
	name="Durand Head"
	icon_state = "durand_head"
	origin_tech = list(TECH(T_DATA) = 2, TECH(T_MATERIAL) = 3, TECH(T_MAGNET) = 3, TECH(T_ENGINEERING) = 3)

/obj/item/mecha_parts/part/durand/left_arm
	name="Durand Left Arm"
	icon_state = "durand_l_arm"

/obj/item/mecha_parts/part/durand/right_arm
	name="Durand Right Arm"
	icon_state = "durand_r_arm"

/obj/item/mecha_parts/part/durand/left_leg
	name="Durand Left Leg"
	icon_state = "durand_l_leg"

/obj/item/mecha_parts/part/durand/right_leg
	name="Durand Right Leg"
	icon_state = "durand_r_leg"

/obj/item/mecha_parts/part/durand/armour
	name="Durand Armour Plates"
	icon_state = "durand_armor"
	origin_tech = list(TECH(T_MATERIAL) = 5, TECH(T_COMBAT) = 4, TECH(T_ENGINEERING) = 5)



////////// Firefighter

/obj/item/mecha_parts/chassis/firefighter
	name = "Firefighter Chassis"
	construct = /datum/construction/mecha/firefighter_chassis
/*
/obj/item/mecha_parts/part/firefighter_torso
	name="Ripley-on-Fire Torso"
	icon_state = "ripley_harness"

/obj/item/mecha_parts/part/firefighter_left_arm
	name="Ripley-on-Fire Left Arm"
	icon_state = "ripley_l_arm"

/obj/item/mecha_parts/part/firefighter_right_arm
	name="Ripley-on-Fire Right Arm"
	icon_state = "ripley_r_arm"

/obj/item/mecha_parts/part/firefighter_left_leg
	name="Ripley-on-Fire Left Leg"
	icon_state = "ripley_l_leg"

/obj/item/mecha_parts/part/firefighter_right_leg
	name="Ripley-on-Fire Right Leg"
	icon_state = "ripley_r_leg"
*/

////////// Phazon

/obj/item/mecha_parts/chassis/phazon
	name = "Phazon Chassis"
	origin_tech = list(TECH(T_MATERIAL) = 7)
	construct = /datum/construction/mecha/phazon_chassis

/obj/item/mecha_parts/part/phazon
	origin_tech = list(TECH(T_MATERIAL) = 5, TECH(T_BLUESPACE) = 2, TECH(T_MAGNET) = 2)

/obj/item/mecha_parts/part/phazon/torso
	name="Phazon Torso"
	icon_state = "phazon_harness"
	origin_tech = list(TECH(T_DATA) = 5, TECH(T_MATERIAL) = 7, TECH(T_BLUESPACE) = 6, TECH(T_POWER) = 6)

/obj/item/mecha_parts/part/phazon/head
	name="Phazon Head"
	icon_state = "phazon_head"
	origin_tech = list(TECH(T_DATA) = 4, TECH(T_MATERIAL) = 5, TECH(T_MAGNET) = 6)

/obj/item/mecha_parts/part/phazon/left_arm
	name="Phazon Left Arm"
	icon_state = "phazon_l_arm"

/obj/item/mecha_parts/part/phazon/right_arm
	name="Phazon Right Arm"
	icon_state = "phazon_r_arm"

/obj/item/mecha_parts/part/phazon/left_leg
	name="Phazon Left Leg"
	icon_state = "phazon_l_leg"

/obj/item/mecha_parts/part/phazon/right_leg
	name="Phazon Right Leg"
	icon_state = "phazon_r_leg"


/obj/item/mecha_parts/part/phazon/armor
	name="Phazon Right Armour"
	icon_state = "phazon_armor"
	origin_tech = list(TECH(T_MATERIAL) = 5, TECH(T_BLUESPACE) = 6, TECH(T_MAGNET) = 3)

///////// Odysseus
/obj/item/mecha_parts/chassis/odysseus
	name = "Odysseus Chassis"
	construct = /datum/construction/mecha/odysseus_chassis

/obj/item/mecha_parts/part/odysseus
	desc="Data and power sockets are compatible with most exosuit tools."
	origin_tech = list(TECH(T_DATA) = 2, TECH(T_MATERIAL) = 2, TECH(T_ENGINEERING) = 2)

/obj/item/mecha_parts/part/odysseus/head
	name="Odysseus Head"
	icon_state = "odysseus_head"
	origin_tech = list(TECH(T_DATA) = 3, TECH(T_MATERIAL) = 2)

/obj/item/mecha_parts/part/odysseus/torso
	name="Odysseus Torso"
	desc="A torso part of Odysseus. Contains power unit, processing core and life support systems."
	icon_state = "odysseus_torso"
	origin_tech = list(TECH(T_DATA) = 2, TECH(T_MATERIAL) = 2, TECH(T_BIO) = 2, TECH(T_ENGINEERING) = 2)

/obj/item/mecha_parts/part/odysseus/left_arm
	name="Odysseus Left Arm"
	desc="An Odysseus left arm. Data and power sockets are compatible with most exosuit tools."
	icon_state = "odysseus_l_arm"

/obj/item/mecha_parts/part/odysseus/right_arm
	name="Odysseus Right Arm"
	icon_state = "odysseus_r_arm"

/obj/item/mecha_parts/part/odysseus/left_leg
	name="Odysseus Left Leg"
	desc="Contains somewhat complex servodrives and balance maintaining systems."
	icon_state = "odysseus_l_leg"

/obj/item/mecha_parts/part/odysseus/right_leg
	name="Odysseus Right Leg"
	desc="A Odysseus right leg. Contains somewhat complex servodrives and balance maintaining systems."
	icon_state = "odysseus_r_leg"

/*/obj/item/mecha_parts/part/odysseus_armour
	name="Odysseus Carapace"
	icon_state = "odysseus_armour"
	origin_tech = list(TECH(T_MATERIAL) = 3, TECH(T_ENGINEERING) = 3)
	construction_time = 200
	construction_cost = list(MATERIAL_STEEL=15000)*/

