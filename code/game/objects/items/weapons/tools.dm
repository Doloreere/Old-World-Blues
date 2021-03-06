//This file was auto-corrected by findeclaration.exe on 25.5.2012 20:42:32

/* Tools!
 * Note: Multitools are /obj/item/device
 *
 * Contains:
 * 		Wrench
 * 		Screwdriver
 * 		Wirecutters
 * 		Welding Tool
 * 		Crowbar
 */

/*
 * Wrench
 */
/obj/item/weapon/wrench
	name = "wrench"
	desc = "A wrench with many common uses. Can usually be found in your hand."
	icon = 'icons/obj/items.dmi'
	icon_state = "wrench"
	flags = CONDUCT
	slot_flags = SLOT_BELT
	force = 6
	throwforce = 7
	w_class = ITEM_SIZE_SMALL
	origin_tech = list(TECH(T_MATERIAL) = 1, TECH(T_ENGINEERING) = 1)
	matter = list(MATERIAL_STEEL = 150)
	attack_verb = list("bashed", "battered", "bludgeoned", "whacked")


/*
 * Screwdriver
 */
/obj/item/weapon/screwdriver
	name = "screwdriver"
	desc = "You can be totally screwwy with this."
	icon = 'icons/obj/items.dmi'
	icon_state = "screwdriver"
	flags = CONDUCT
	slot_flags = SLOT_BELT | SLOT_EARS
	force = 6
	w_class = ITEM_SIZE_TINY
	throwforce = 5
	throw_speed = 3
	throw_range = 5
	matter = list(MATERIAL_STEEL = 75)
	attack_verb = list("stabbed")
	sharp  = 1
	randpixel = 16

	suicide_act(mob/user)
		viewers(user) << pick(\
			"<span class='danger'>\The [user] is stabbing the [src.name] into \his temple! It looks like \he's trying to commit suicide.</span>", \
			"<span class='danger'>\The [user] is stabbing the [src.name] into \his heart! It looks like \he's trying to commit suicide.</span>")
		return(BRUTELOSS)

/obj/item/weapon/screwdriver/initialize()
	switch(pick("red","blue","purple","brown","green","cyan","yellow"))
		if ("red")
			icon_state = "screwdriver2"
			item_state = "screwdriver"
		if ("blue")
			icon_state = "screwdriver"
			item_state = "screwdriver_blue"
		if ("purple")
			icon_state = "screwdriver3"
			item_state = "screwdriver_purple"
		if ("brown")
			icon_state = "screwdriver4"
			item_state = "screwdriver_brown"
		if ("green")
			icon_state = "screwdriver5"
			item_state = "screwdriver_green"
		if ("cyan")
			icon_state = "screwdriver6"
			item_state = "screwdriver_cyan"
		if ("yellow")
			icon_state = "screwdriver7"
			item_state = "screwdriver_yellow"

	. = ..()

/obj/item/weapon/screwdriver/attack(mob/living/carbon/M as mob, mob/living/carbon/user as mob)
	if(!istype(M) || user.a_intent == "help")
		return ..()
	if(user.zone_sel.selecting != O_EYES && user.zone_sel.selecting != BP_HEAD)
		return ..()
	//TODO: DNA3 clown_block
	/*
	if((CLUMSY in user.mutations) && prob(50))
		M = user
	*/
	return eyestab(M,user)

/*
 * Wirecutters
 */
/obj/item/weapon/wirecutters
	name = "wirecutters"
	desc = "This cuts wires."
	icon = 'icons/obj/items.dmi'
	icon_state = "cutters"
	flags = CONDUCT
	slot_flags = SLOT_BELT
	force = 6
	throw_speed = 2
	throw_range = 9
	w_class = ITEM_SIZE_SMALL
	origin_tech = list(TECH(T_MATERIAL) = 1, TECH(T_ENGINEERING) = 1)
	matter = list(MATERIAL_STEEL = 80)
	attack_verb = list("pinched", "nipped")
	sharp = 1
	edge = 1

/obj/item/weapon/wirecutters/initialize()
	if(prob(50))
		icon_state = "cutters-y"
		item_state = "cutters_yellow"
	return ..()

/obj/item/weapon/wirecutters/attack(mob/living/carbon/C as mob, mob/user as mob)
	if(user.a_intent == I_HELP && istype(C) && istype(C.handcuffed, /obj/item/weapon/handcuffs/cable))
		usr.visible_message(
			"\The [usr] cuts \the [C]'s restraints with \the [src]!",
			"You cut \the [C]'s restraints with \the [src]!",
			"You hear cable being cut."
		)
		C.handcuffed = null
		if(C.buckled && C.buckled.buckle_require_restraints)
			C.buckled.unbuckle_mob()
		C.update_inv_handcuffed()
		return
	else
		..()

/*
 * Welding Tool
 */
/obj/item/weapon/weldingtool
	name = "welding tool"
	icon = 'icons/obj/items.dmi'
	icon_state = "welder"
	flags = CONDUCT
	slot_flags = SLOT_BELT

	//Amount of OUCH when it's thrown
	force = 3.0
	throwforce = 5.0
	throw_speed = 1
	throw_range = 5
	w_class = ITEM_SIZE_SMALL

	//Cost to make in the autolathe
	matter = list(MATERIAL_STEEL = 70, MATERIAL_GLASS = 30)

	//R&D tech level
	origin_tech = list(TECH(T_ENGINEERING) = 1)

	//Welding tool specific stuff
	var/welding = 0 	//Whether or not the welding tool is off(0), on(1) or currently welding(2)
	var/status = 1 		//Whether the welder is secured or unsecured (able to attach rods to it to make a flamethrower)
	var/max_fuel = 20 	//The max amount of fuel the welder can hold

/obj/item/weapon/weldingtool/initialize()
	. = ..()
	create_reagents(max_fuel)
	reagents.add_reagent("fuel", max_fuel)

/obj/item/weapon/weldingtool/Destroy()
	if(welding)
		processing_objects -= src
	. = ..()

/obj/item/weapon/weldingtool/examine(mob/user, return_dist = 1)
	. = ..()
	if(.<=1)
		user << text("\icon[] [] contains []/[] units of fuel!", src, src.name, get_fuel(),src.max_fuel )


/obj/item/weapon/weldingtool/attackby(obj/item/W as obj, mob/living/user as mob)
	if(istype(W,/obj/item/weapon/screwdriver))
		if(welding)
			user << "<span class='danger'>Stop welding first!</span>"
			return
		status = !status
		if(status)
			user << SPAN_NOTE("You secure the welder.")
		else
			user << SPAN_NOTE("The welder can now be attached and modified.")
		src.add_fingerprint(user)
		return

	if((!status) && (istype(W,/obj/item/stack/rods)))
		var/obj/item/stack/rods/R = W
		R.use(1)
		var/obj/item/weapon/flamethrower/F = new/obj/item/weapon/flamethrower(user.loc)
		src.forceMove(F)
		F.weldtool = src
		if (user.client)
			user.client.screen -= src
		if (user.r_hand == src)
			user.remove_from_mob(src)
		else
			user.remove_from_mob(src)
		src.master = F
		src.layer = initial(src.layer)
		user.remove_from_mob(src)
		if (user.client)
			user.client.screen -= src
		src.forceMove( F)
		src.add_fingerprint(user)
		return

	..()
	return


/obj/item/weapon/weldingtool/process()
	if(welding)
		if(prob(5))
			remove_fuel(1)

		if(get_fuel() < 1)
			setWelding(0)

	//I'm not sure what this does. I assume it has to do with starting fires...
	//...but it doesnt check to see if the welder is on or not.
	var/turf/location = get_turf(src)
	if (isturf(location))
		location.hotspot_expose(700, 5)


/obj/item/weapon/weldingtool/afterattack(obj/O as obj, mob/user as mob, proximity)
	if(!proximity) return
	if (istype(O, /obj/structure/reagent_dispensers/fueltank) && !src.welding)
		O.reagents.trans_to_obj(src, max_fuel)
		user << SPAN_NOTE("Welder refueled")
		playsound(src.loc, 'sound/effects/refill.ogg', 50, 1, -6)
		return
	else if (istype(O, /obj/structure/reagent_dispensers/fueltank) && src.welding)
		log_game("[key_name(user)] triggered a fueltank explosion with a welding tool.", O)
		user << "<span class='danger'>You begin welding on the fueltank and with a moment of lucidity you realize, this might not have been the smartest thing you've ever done.</span>"
		var/obj/structure/reagent_dispensers/fueltank/tank = O
		tank.explode()
		return
	if (src.welding)
		remove_fuel(1)
		var/turf/location = get_turf(user)
		if(isliving(O))
			var/mob/living/L = O
			L.IgniteMob()
		if (istype(location, /turf))
			location.hotspot_expose(700, 50, 1)
	return


/obj/item/weapon/weldingtool/attack_self(mob/user as mob)
	setWelding(!welding, usr)
	return

/obj/item/weapon/weldingtool/attack(var/atom/A, var/mob/living/user, var/def_zone)
	if(ishuman(A) && user.a_intent == I_HELP)
		var/mob/living/carbon/human/H = A
		var/obj/item/organ/external/S = H.get_organ(user.zone_sel.selecting)

		if(!S || S.robotic < ORGAN_ROBOT || S.open == 3)
			return ..()

		if(!welding)
			user << "<span class='warning'>You'll need to turn [src] on to patch the damage on [H]'s [S.name]!</span>"
			return 1

		if(S.robo_repair(15, BRUTE, "some dents", src, user))
			remove_fuel(1, user)

	else
		return ..()

//Returns the amount of fuel in the welder
/obj/item/weapon/weldingtool/proc/get_fuel()
	return reagents.get_reagent_amount("fuel")


//Removes fuel from the welding tool.
//If a mob is passed, it will perform an eyecheck on the mob. This should probably be renamed to use()
/obj/item/weapon/weldingtool/proc/remove_fuel(var/amount = 1, var/mob/M = null)
	if(!welding)
		return 0
	if(get_fuel() >= amount)
		reagents.remove_reagent("fuel", amount)
		if(M)
			eyecheck(M)
		return 1
	else
		if(M)
			M << SPAN_NOTE("You need more welding fuel to complete this task.")
		return 0

//Returns whether or not the welding tool is currently on.
/obj/item/weapon/weldingtool/proc/isOn()
	return src.welding

/obj/item/weapon/weldingtool/update_icon()
	..()
	icon_state = welding ? "[initial(icon_state)]1" : initial(icon_state)
	var/mob/M = loc
	if(istype(M))
		M.update_inv_l_hand()
		M.update_inv_r_hand()

//Sets the welding state of the welding tool. If you see W.welding = 1 anywhere, please change it to W.setWelding(1)
//so that the welding tool updates accordingly
/obj/item/weapon/weldingtool/proc/setWelding(var/set_welding, var/mob/M)
	if(!status)	return

	var/turf/T = get_turf(src)
	//If we're turning it on
	if(set_welding && !welding)
		if (get_fuel() > 0)
			if(M)
				M << SPAN_NOTE("You switch the [src] on.")
			else if(T)
				T.visible_message("<span class='danger'>\The [src] turns on.</span>")
			src.force = 15
			src.damtype = "fire"
			src.w_class = ITEM_SIZE_LARGE
			welding = 1
			update_icon()
			processing_objects |= src
		else
			if(M)
				M << SPAN_NOTE("You need more welding fuel to complete this task.")
			return
	//Otherwise
	else if(!set_welding && welding)
		processing_objects -= src
		if(M)
			M << SPAN_NOTE("You switch \the [src] off.")
		else if(T)
			T.visible_message("<span class='warning'>\The [src] turns off.</span>")
		src.force = 3
		src.damtype = "brute"
		src.w_class = initial(src.w_class)
		src.welding = 0
		update_icon()

//Decides whether or not to damage a player's eyes based on what they're wearing as protection
//Note: This should probably be moved to mob
/obj/item/weapon/weldingtool/proc/eyecheck(mob/living/carbon/human/user as mob)
	if(!ishuman(user)) return 1

	var/safety = user.eyecheck()
	var/obj/item/organ/internal/eyes/E = user.internal_organs_by_name[O_EYES]
	if(!E)
		return
	if(user.species.flags & IS_SYNTHETIC)
		return
	switch(safety)
		if(1)
			usr << SPAN_WARN("Your eyes sting a little.")
			E.take_damage(rand(1, 2))
			if(E.damage > 12)
				user.eye_blurry += rand(3,6)
		if(0)
			usr << SPAN_WARN("Your eyes burn.")
			E.take_damage(rand(2, 4))
			if(E.damage > 10)
				E.take_damage(rand(4,10))
		if(-1)
			usr << SPAN_DANG("Your thermals intensify the welder's glow. Your eyes itch and burn severely.")
			E.take_damage(rand(12, 16))
			user.eye_blurry += rand(12,20)
	return


/obj/item/weapon/weldingtool/largetank
	name = "industrial welding tool"
	icon_state = "industrialwelder"
	max_fuel = 40
	origin_tech = list(TECH(T_ENGINEERING) = 2)
	matter = list(MATERIAL_STEEL = 70, MATERIAL_GLASS = 60)

/obj/item/weapon/weldingtool/hugetank
	name = "upgraded welding tool"
	max_fuel = 80
	w_class = ITEM_SIZE_NORMAL
	origin_tech = list(TECH(T_ENGINEERING) = 3)
	matter = list(MATERIAL_STEEL = 70, MATERIAL_GLASS = 120)

/obj/item/weapon/weldingtool/experimental
	name = "experimental welding tool"
	max_fuel = 40
	w_class = ITEM_SIZE_NORMAL
	origin_tech = list(TECH(T_ENGINEERING) = 4, TECH(T_PHORON) = 3)
	matter = list(MATERIAL_STEEL = 70, MATERIAL_GLASS = 120)
	var/last_gen = 0

//Proc to make the experimental welder generate fuel, optimized as fuck -Sieve
/obj/item/weapon/weldingtool/experimental/proc/fuel_gen()
	var/gen_amount = ((world.time-last_gen)/25)
	reagents += (gen_amount)
	if(reagents > max_fuel)
		reagents = max_fuel

/*
 * Crowbar
 */

/obj/item/weapon/crowbar
	name = "crowbar"
	desc = "Used to remove floors and to pry open doors."
	icon = 'icons/obj/items.dmi'
	icon_state = "crowbar"
	flags = CONDUCT
	slot_flags = SLOT_BELT
	force = 6
	throwforce = 7
	pry = 1
	item_state = "crowbar"
	w_class = ITEM_SIZE_SMALL
	origin_tech = list(TECH(T_ENGINEERING) = 1)
	matter = list(MATERIAL_STEEL = 50)
	attack_verb = list("attacked", "bashed", "battered", "bludgeoned", "whacked")

/obj/item/weapon/crowbar/red
	icon = 'icons/obj/items.dmi'
	icon_state = "red_crowbar"
	item_state = "crowbar_red"

/*/obj/item/weapon/combitool
	name = "combi-tool"
	desc = "It even has one of those nubbins for doing the thingy."
	icon = 'icons/obj/items.dmi'
	icon_state = "combitool"
	w_class = ITEM_SIZE_SMALL

	var/list/spawn_tools = list(
		/obj/item/weapon/screwdriver,
		/obj/item/weapon/wrench,
		/obj/item/weapon/wirecutters,
		/obj/item/weapon/material/kitchen/utensil/knife,
		/obj/item/weapon/material/kitchen/utensil/fork,
		/obj/item/weapon/material/hatchet
		)
	var/list/tools = list()
	var/current_tool = 1

/obj/item/weapon/combitool/examine()
	. = ..()
	if(loc == usr && tools.len)
		usr << "It has the following fittings:"
		for(var/obj/item/tool in tools)
			usr << "\icon[tool] - [tool.name][tools[current_tool]==tool?" (selected)":""]"

/obj/item/weapon/combitool/New()
	..()
	for(var/type in spawn_tools)
		tools |= new type(src)

/obj/item/weapon/combitool/attack_self(mob/user as mob)
	if(++current_tool > tools.len) current_tool = 1
	var/obj/item/tool = tools[current_tool]
	if(!tool)
		user << "You can't seem to find any fittings in \the [src]."
	else
		user << "You switch \the [src] to the [tool.name] fitting."
	return 1

/obj/item/weapon/combitool/attack(mob/living/carbon/M as mob, mob/living/carbon/user as mob)
	if(!M.Adjacent(user))
		return 0
	var/obj/item/tool = tools[current_tool]
	if(!tool) return 0
	return (tool ? tool.attack(M,user) : 0)

/obj/item/weapon/combitool/afterattack(var/atom/target, var/mob/living/user, proximity, params)
	if(!proximity)
		return 0
	var/obj/item/tool = tools[current_tool]
	if(!tool) return 0
	tool.forceMove(user)
	var/resolved = target.attackby(tool,user)
	if(!resolved && tool && target)
		tool.afterattack(target,user,1)
	if(tool)
		tool.forceMove(src)*/
