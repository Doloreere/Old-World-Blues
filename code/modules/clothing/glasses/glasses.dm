///////////////////////////////////////////////////////////////////////
//Glasses
/*
SEE_SELF  // can see self, no matter what
SEE_MOBS  // can see all mobs, no matter what
SEE_OBJS  // can see all objs, no matter what
SEE_TURFS // can see all turfs (and areas), no matter what
SEE_PIXELS// if an object is located on an unlit area, but some of its pixels are
          // in a lit area (via pixel_x,y or smooth movement), can see those pixels
BLIND     // can't see anything
*/
///////////////////////////////////////////////////////////////////////

/obj/item/clothing/glasses
	name = "glasses"
	icon = 'icons/inv_slots/glasses/icon.dmi'
	w_class = ITEM_SIZE_SMALL
	slot_flags = SLOT_EYES
	var/vision_flags = 0
	var/darkness_view = 0//Base human is 2
	var/see_invisible = -1
	var/prescription = 0
	var/toggleable = 0
	var/off_state = "degoggles"
	var/active = 1
	var/activation_sound = 'sound/items/goggles_charge.ogg'
	var/obj/screen/overlay = null
	body_parts_covered = EYES

/obj/item/clothing/glasses/update_clothing_icon()
	if (ismob(src.loc))
		var/mob/M = src.loc
		M.update_inv_glasses()

/obj/item/clothing/glasses/attack_self(mob/user)
	if(toggleable)
		active = !active
		if(active)
			icon_state = initial(icon_state)
			if(activation_sound)
				usr << activation_sound
			usr << "You activate the optical matrix on the [src]."
		else
			icon_state = off_state
			usr << "You deactivate the optical matrix on the [src]."
		user.update_inv_glasses()

/obj/item/clothing/glasses/meson
	name = "Optical Meson Scanner"
	desc = "Used for seeing walls, floors, and stuff through anything."
	icon_state = "meson"
	item_state = "glasses"
	icon_action_button = "action_meson" //This doesn't actually matter, the action button is generated from the current icon_state. But, this is the only way to get it to show up.
	origin_tech = list(TECH_MAGNET = 2, TECH_ENGINEERING = 2)
	toggleable = 1
	vision_flags = SEE_TURFS

/obj/item/clothing/glasses/meson/initialize()
	. = ..()
	overlay = global_hud.meson

/obj/item/clothing/glasses/meson/prescription
	name = "prescription mesons"
	desc = "Optical Meson Scanner with prescription lenses."
	prescription = 1

/obj/item/clothing/glasses/science
	name = "Science Goggles"
	desc = "The goggles do nothing!"
	icon_state = "purple"
	item_state = "glasses"
	toggleable = 1
	icon_action_button = "action_science"

/obj/item/clothing/glasses/science/initialize()
	. = ..()
	overlay = global_hud.science

/obj/item/clothing/glasses/night
	name = "Night Vision Goggles"
	desc = "You can totally see in the dark now!"
	icon_state = "night"
	item_state = "glasses"
	origin_tech = list(TECH_MAGNET = 2)
	darkness_view = 7
	toggleable = 1
	see_invisible = SEE_INVISIBLE_OBSERVER_NOLIGHTING
	icon_action_button = "action_nvg"
	off_state = "denight"

/obj/item/clothing/glasses/night/initialize()
	. = ..()
	overlay = global_hud.nvg

/obj/item/clothing/glasses/eyepatch
	name = "eyepatch"
	desc = "Yarr."
	icon_state = "eyepatch"
	item_state = ""
	body_parts_covered = 0

	New(var/mob/living/carbon/human/H)
		..()
		if(istype(H))
			if(!istype(H.internal_organs_by_name[O_EYES], /obj/item/organ/internal/eyes/oneeye/right))
				icon_state = "[initial(icon_state)]_l"

	verb/switcheye()
		set name = "Switch Eyepatch"
		set category = "Object"
		set src in usr

		if(!isliving(usr))
			return
		if(usr.incapacitated())
			return

		if(icon_state == initial(icon_state))
			icon_state = "[initial(icon_state)]_l"
		else
			icon_state = initial(icon_state)

		update_clothing_icon()

/obj/item/clothing/glasses/monocle
	name = "monocle"
	desc = "Such a dapper eyepiece!"
	icon_state = "monocle"
	item_state = "headset" // lol
	body_parts_covered = 0

/obj/item/clothing/glasses/material
	name = "Optical Material Scanner"
	desc = "Very confusing glasses."
	icon_state = "material"
	item_state = "glasses"
	icon_action_button = "action_material"
	origin_tech = list(TECH_MAGNET = 3, TECH_ENGINEERING = 3)
	toggleable = 1
	vision_flags = SEE_OBJS

/obj/item/clothing/glasses/regular
	name = "Prescription Glasses"
	desc = "Made by Nerd. Co."
	icon_state = "glasses"
	item_state = "glasses"
	prescription = 1
	body_parts_covered = 0

/obj/item/clothing/glasses/regular/scanners
	name = "Scanning Goggles"
	desc = "A very oddly shaped pair of goggles with bits of wire poking out the sides. A soft humming sound emanates from it."
	icon_state = "uzenwa_sissra_1"

/obj/item/clothing/glasses/regular/hipster
	name = "Prescription Glasses"
	desc = "Made by Uncool. Co."
	icon_state = "hipster_glasses"
	item_state = "hipster_glasses"

/obj/item/clothing/glasses/threedglasses
	desc = "A long time ago, people used these glasses to makes images from screens threedimensional."
	name = "3D glasses"
	icon_state = "3d"
	item_state = "3d"
	body_parts_covered = 0

/obj/item/clothing/glasses/gglasses
	name = "Green Glasses"
	desc = "Forest green glasses, like the kind you'd wear when hatching a nasty scheme."
	icon_state = "gglasses"
	item_state = "gglasses"
	body_parts_covered = 0

/obj/item/clothing/glasses/sunglasses
	desc = "Strangely ancient technology used to help provide rudimentary eye cover. Enhanced shielding blocks many flashes."
	name = "sunglasses"
	icon_state = "sun"
	item_state = "sunglasses"
	darkness_view = -1

/obj/item/clothing/glasses/sunglasses/aviator
	desc = "Strangely ancient technology used to help provide rudimentary eye cover. Enhanced shielding blocks many flashes."
	name = "aviator sunglasses"
	icon_state = "aviator"
	item_state = "aviator"

/obj/item/clothing/glasses/sunglasses/aviator_black
	desc = "Strangely ancient technology used to help provide rudimentary eye cover. Enhanced shielding blocks many flashes."
	name = "black aviator sunglasses"
	icon_state = "aviator_black"
	item_state = "aviator_black"

/obj/item/clothing/glasses/sunglasses/aviator_bloody
	desc = "Strangely ancient technology used to help provide rudimentary eye cover. Enhanced shielding blocks many flashes."
	name = "bloody aviator sunglasses"
	icon_state = "aviator_bloody"
	item_state = "aviator_bloody"
/*
/obj/item/clothing/glasses/meson/aviator/prescription
	name = "engineering aviators"
	desc = "Engineering Aviators with prescription lenses."
	prescription = 1
		off_state = "aviator_hud"
	item_state_slots = list(slot_r_hand_str = "sunglasses", slot_l_hand_str = "sunglasses")
	action_button_name = "Toggle HUD"
	//activation_sound = 'sound/effects/pop.ogg'

/obj/item/clothing/glasses/hud/health/aviator
	name = "medical HUD aviators"
	desc = "Modified aviator glasses with a toggled health HUD."
	icon_state = "aviator_med"
	off_state = "sec_hud"
	action_button_name = "Toggle Mode"
	toggleable = 1
	//activation_sound = 'sound/effects/pop.ogg'

/obj/item/clothing/glasses/hud/health/aviator/prescription
	name = "prescription medical HUD aviators"
	desc = "Modified aviator glasses with a toggled health HUD. Comes with bonus prescription lenses."
	prescription = 6
*/

/obj/item/clothing/glasses/sunglasses/red
	name = "crimson glasses"
	desc = "They make you look like an elite agent."
	icon_state = "red"
	item_state = "red"

/obj/item/clothing/glasses/orange
	name = "orange glasses"
	desc = "A sweet pair of orange shades."
	icon_state = "orangeglasses"
	item_state = "orangeglasses"

/obj/item/clothing/glasses/red
	name = "red glasses"
	desc = "A sweet pair of red shades."
	icon_state = "redglasses"
	item_state = "redglasses"

/obj/item/clothing/glasses/welding
	name = "welding goggles"
	desc = "Protects the eyes from welders, approved by the mad scientist association."
	icon_state = "welding-g"
	item_state = "welding-g"
	icon_action_button = "action_welding_g"
	matter = list(MATERIAL_STEEL = 1500, MATERIAL_GLASS = 1000)
	var/up = 0

/obj/item/clothing/glasses/welding/attack_self()
	toggle()

/obj/item/clothing/glasses/welding/verb/toggle()
	set category = "Object"
	set name = "Adjust welding goggles"
	set src in usr

	if(usr.incapacitated())
		if(src.up)
			src.up = !src.up
			flags_inv |= HIDEEYES
			body_parts_covered |= EYES
			icon_state = initial(icon_state)
			usr << "You flip \the [src] down to protect your eyes."
		else
			src.up = !src.up
			flags_inv &= ~HIDEEYES
			body_parts_covered &= ~EYES
			icon_state = "[initial(icon_state)]up"
			usr << "You push \the [src] up out of your face."
		update_clothing_icon()

/obj/item/clothing/glasses/welding/superior
	name = "superior welding goggles"
	desc = "Welding goggles made from more expensive materials, strangely smells like potatoes."
	icon_state = "rwelding-g"
	item_state = "rwelding-g"
	icon_action_button = "action_welding_g"

/obj/item/clothing/glasses/sunglasses/blindfold
	name = "blindfold"
	desc = "Covers the eyes, preventing sight."
	icon_state = "blindfold"
	item_state = "blindfold"
	//vision_flags = BLIND  	// This flag is only supposed to be used if it causes permanent blindness, not temporary because of glasses

/obj/item/clothing/glasses/sunglasses/prescription
	name = "prescription sunglasses"
	prescription = 1

/obj/item/clothing/glasses/sunglasses/big
	desc = "Strangely ancient technology used to help provide rudimentary eye cover. Larger than average enhanced shielding blocks many flashes."
	icon_state = "bigsunglasses"
	item_state = "bigsunglasses"

/obj/item/clothing/glasses/sunglasses/sechud
	name = "HUDSunglasses"
	desc = "Sunglasses with a HUD."
	icon_state = "sunhud"
	var/obj/item/clothing/glasses/hud/security/hud = null

	initialize()
		. = ..()
		src.hud = new/obj/item/clothing/glasses/hud/security(src)

/obj/item/clothing/glasses/sunglasses/sechud/tactical
	name = "tactical HUD"
	desc = "Flash-resistant goggles with inbuilt combat and security information."
	icon_state = "swatgoggles"

/obj/item/clothing/glasses/thermal
	name = "Optical Thermal Scanner"
	desc = "Thermals in the shape of glasses."
	icon_state = "thermal"
	item_state = "glasses"
	origin_tech = list(TECH_MAGNET = 3)
	toggleable = 1
	icon_action_button = "action_thermal"
	vision_flags = SEE_MOBS

	emp_act(severity)
		if(ishuman(src.loc))
			var/mob/living/carbon/human/M = src.loc
			M << "\red The Optical Thermal Scanner overloads and blinds you!"
			if(M.glasses == src)
				M.eye_blind = 3
				M.eye_blurry = 5
				// Don't cure being nearsighted
				if(!(M.disabilities & NEARSIGHTED))
					M.disabilities |= NEARSIGHTED
					spawn(100)
						M.disabilities &= ~NEARSIGHTED
		..()

/obj/item/clothing/glasses/thermal/initialize()
	. = ..()
	overlay = global_hud.thermal

/obj/item/clothing/glasses/thermal/syndi	//These are now a traitor item, concealed as mesons.	-Pete
	name = "Optical Meson Scanner"
	desc = "Used for seeing walls, floors, and stuff through anything."
	icon_state = "meson"
	origin_tech = list(TECH_MAGNET = 3, TECH_ILLEGAL = 4)

/obj/item/clothing/glasses/thermal/plain
	toggleable = 0
	activation_sound = null
	icon_action_button = ""

/obj/item/clothing/glasses/thermal/plain/monocle
	name = "Thermoncle"
	desc = "A monocle thermal."
	icon_state = "thermoncle"
	flags = null //doesn't protect eyes because it's a monocle, duh

	body_parts_covered = 0

/obj/item/clothing/glasses/thermal/plain/eyepatch
	name = "Optical Thermal Eyepatch"
	desc = "An eyepatch with built-in thermal optics"
	icon_state = "eyepatch"
	item_state = "eyepatch"
	body_parts_covered = 0

/obj/item/clothing/glasses/thermal/plain/jensen
	name = "Optical Thermal Implants"
	desc = "A set of implantable lenses designed to augment your vision"
	icon_state = "thermalimplants"
	item_state = "syringe_kit"
