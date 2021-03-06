/obj/item/weapon/weldpack
	name = "Welding kit"
	desc = "A heavy-duty, portable welding fluid carrier."
	slot_flags = SLOT_BACK
	icon = 'icons/obj/storage.dmi'
	icon_state = "welderpack"
	w_class = ITEM_SIZE_LARGE
	var/max_fuel = 350

/obj/item/weapon/weldpack/initialize()
	. = ..()
	create_reagents(max_fuel)
	reagents.add_reagent("fuel", max_fuel)

/obj/item/weapon/weldpack/attackby(obj/item/W as obj, mob/user as mob)
	if(istype(W, /obj/item/weapon/weldingtool))
		var/obj/item/weapon/weldingtool/T = W
		if(T.welding & prob(50))
			log_game("[key_name(user)] triggered a fueltank explosion.", src)
			user << SPAN_DANG("That was stupid of you.")
			explosion(get_turf(src),-1,0,2)
			if(src)
				qdel(src)
			return
		else
			if(T.welding)
				user << "\red That was close!"
			src.reagents.trans_to_obj(W, T.max_fuel)
			user << SPAN_NOTE("Welder refilled!")
			playsound(src.loc, 'sound/effects/refill.ogg', 50, 1, -6)
			return
	user << SPAN_NOTE("The tank scoffs at your insolence.  It only provides services to welders.")
	return

/obj/item/weapon/weldpack/afterattack(obj/O as obj, mob/user as mob, proximity)
	if(!proximity) // this replaces and improves the get_dist(src,O) <= 1 checks used previously
		return
	if (istype(O, /obj/structure/reagent_dispensers/fueltank) && src.reagents.total_volume < max_fuel)
		O.reagents.trans_to_obj(src, max_fuel)
		user << SPAN_NOTE("You crack the cap off the top of the pack and fill it back up again from the tank.")
		playsound(src.loc, 'sound/effects/refill.ogg', 50, 1, -6)
		return
	else if (istype(O, /obj/structure/reagent_dispensers/fueltank) && src.reagents.total_volume == max_fuel)
		user << SPAN_NOTE("The pack is already full!")
		return

/obj/item/weapon/weldpack/examine(mob/user, return_dist = 1)
	. = ..()
	if(.<=1)
		user << text("\icon[] [] units of fuel left!", src, src.reagents.total_volume)
