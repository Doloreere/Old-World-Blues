/obj/structure/closet/secure_closet/personal
	name = "personal closet"
	desc = "It's a secure locker for personnel. The first card swiped gains control."
	req_access = list(access_all_personal_lockers)
	var/registered_name = null

/obj/structure/closet/secure_closet/personal/willContatin()
	. = list(/obj/item/device/radio/headset)
	. += pick(getBackpackTypes(BACKPACK_COMMON))


/obj/structure/closet/secure_closet/personal/patient
	name = "patient's closet"

/obj/structure/closet/secure_closet/personal/patient/willContatin()
	return list(
		/obj/item/clothing/under/color/white,
		/obj/item/clothing/shoes/white,
	)

/obj/structure/closet/secure_closet/personal/cabinet
	icon_state = "cabinetdetective"
	icon_opened = "cabinetdetective_open"

/obj/structure/closet/secure_closet/personal/cabinet/willContatin()
	return list(
		/obj/item/storage/backpack/satchel/withwallet,
		/obj/item/device/radio/headset,
	)

/obj/structure/closet/secure_closet/personal/attackby(obj/item/weapon/W as obj, mob/user as mob)
	if (src.opened)
		user.unEquip(W, src.loc)
	else if(istype(W, /obj/item/device/pda))
		var/obj/item/device/pda/P = W
		if(P.id)
			return src.attackby(P.id)
	else if(istype(W, /obj/item/weapon/card/id))
		if(src.broken)
			user << SPAN_WARN("It appears to be broken.")
			return
		var/obj/item/weapon/card/id/I = W
		if(!I || !I.registered_name)	return
		if(src.allowed(user) || !src.registered_name || (istype(I) && (src.registered_name == I.registered_name)))
			//they can open all lockers, or nobody owns this, or they own this locker
			src.locked = !( src.locked )
			update_icon()

			if(!src.registered_name)
				src.registered_name = I.registered_name
				src.desc = "Owned by [I.registered_name]."
		else
			user << SPAN_WARN("Access Denied")
	else if(istype(W, /obj/item/weapon/melee/energy/blade))
		if(emag_act(INFINITY, user, "The locker has been sliced open by [user] with \an [W]!", "You hear metal being sliced and sparks flying."))
			var/datum/effect/effect/system/spark_spread/spark_system = new /datum/effect/effect/system/spark_spread()
			spark_system.set_up(5, 0, src.loc)
			spark_system.start()
			playsound(src.loc, 'sound/weapons/blade1.ogg', 50, 1)
			playsound(src.loc, "sparks", 50, 1)
	else
		user << "<span class='warning'>Access Denied</span>"
	return

/obj/structure/closet/secure_closet/personal/emag_act(var/remaining_charges, var/mob/user, var/visual_feedback, var/audible_feedback)
	if(!opened && !broken)
		broken = 1
		locked = 0
		desc = "It appears to be broken."
		update_icon()
		if(visual_feedback)
			visible_message("<span class='warning'>[visual_feedback]</span>", "<span class='warning'>[audible_feedback]</span>")
		return 1
	else
		return -1

/obj/structure/closet/secure_closet/personal/verb/reset()
	set src in oview(1) // One square distance
	set category = "Object"
	set name = "Reset Lock"

	// Don't use it if you're not able to! Checks for stuns, ghost and restrain
	if(usr.incapacitated())
		return
	if(ishuman(usr))
		src.add_fingerprint(usr)
		if (src.locked || !src.registered_name)
			usr << "<span class='warning'>You need to unlock it first.</span>"
		else if (src.broken)
			usr << "<span class='warning'>It appears to be broken.</span>"
		else
			if (src.opened)
				if(!src.close())
					return
			src.locked = 1
			update_icon()
			src.registered_name = null
			src.desc = "It's a secure locker for personnel. The first card swiped gains control."
