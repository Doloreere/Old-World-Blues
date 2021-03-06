
///////////////////////////////////////////////Condiments
//Notes by Darem: The condiments food-subtype is for stuff you don't actually eat but you use to modify existing food.
//They all leave empty containers when used up and can be filled/re-filled with other items.
//Formatting for first section is identical to mixed-drinks code.
//If you want an object that starts pre-loaded, you need to make it in addition to the other code.

//Food items that aren't eaten normally and leave an empty container behind.
/obj/item/weapon/reagent_containers/condiment
	name = "Condiment Container"
	desc = "Just your average condiment container."
	icon = 'icons/obj/food.dmi'
	icon_state = "emptycondiment"
	flags = OPENCONTAINER
	possible_transfer_amounts = list(1,5,10)
	center_of_mass = list("x"=16, "y"=6)
	volume = 50

/obj/item/weapon/reagent_containers/condiment/attackby(var/obj/item/weapon/W as obj, var/mob/user as mob)
	return

/obj/item/weapon/reagent_containers/condiment/attack_self(var/mob/user as mob)
	return

/obj/item/weapon/reagent_containers/condiment/attack(var/mob/M as mob, var/mob/user as mob, var/def_zone)
	standard_feed_mob(user, M)

/obj/item/weapon/reagent_containers/condiment/afterattack(var/obj/target, var/mob/user, var/flag)
	if(standard_dispenser_refill(user, target))
		return
	if(standard_pour_into(user, target))
		return

	// These are not opencontainers but we can transfer to them
	if(istype(target, /obj/item/weapon/reagent_containers/food/snacks))
		if(!reagents || !reagents.total_volume)
			user << SPAN_NOTE("There is no condiment left in \the [src].")
			return

		if(!target.reagents.get_free_space())
			user << SPAN_NOTE("You can't add more condiment to \the [target].")
			return

		var/trans = reagents.trans_to_obj(target, amount_per_transfer_from_this)
		user << SPAN_NOTE("You add [trans] units of the condiment to \the [target].")
	else
		..()

/obj/item/weapon/reagent_containers/condiment/feed_sound(var/mob/user)
	playsound(user.loc, 'sound/items/drink.ogg', rand(10, 50), 1)

/obj/item/weapon/reagent_containers/condiment/self_feed_message(var/mob/user)
	user << SPAN_NOTE("You swallow some of contents of \the [src].")

/obj/item/weapon/reagent_containers/condiment/on_reagent_change()
	if(reagents.reagent_list.len > 0)
		switch(reagents.get_master_reagent_id())
			if("ketchup")
				name = "Ketchup"
				desc = "You feel more American already."
				icon_state = "ketchup"
				center_of_mass = list("x"=16, "y"=6)
			if("capsaicin")
				name = "Hotsauce"
				desc = "You can almost TASTE the stomach ulcers now!"
				icon_state = "hotsauce"
				center_of_mass = list("x"=16, "y"=6)
			if("enzyme")
				name = "Universal Enzyme"
				desc = "Used in cooking various dishes."
				icon_state = "enzyme"
				center_of_mass = list("x"=16, "y"=6)
			if("soysauce")
				name = "Soy Sauce"
				desc = "A salty soy-based flavoring."
				icon_state = "soysauce"
				center_of_mass = list("x"=16, "y"=6)
			if("frostoil")
				name = "Coldsauce"
				desc = "Leaves the tongue numb in its passage."
				icon_state = "coldsauce"
				center_of_mass = list("x"=16, "y"=6)
			if("sodiumchloride")
				name = "Salt Shaker"
				desc = "Salt. From space oceans, presumably."
				icon_state = "saltshaker"
				center_of_mass = list("x"=16, "y"=10)
			if("blackpepper")
				name = "Pepper Mill"
				desc = "Often used to flavor food or make people sneeze."
				icon_state = "peppermillsmall"
				center_of_mass = list("x"=16, "y"=10)
			if("cornoil")
				name = "Corn Oil"
				desc = "A delicious oil used in cooking. Made from corn."
				icon_state = "oliveoil"
				center_of_mass = list("x"=16, "y"=6)
			if("sugar")
				name = "Sugar"
				desc = "Tastey space sugar!"
				center_of_mass = list("x"=16, "y"=6)
			else
				name = "Misc Condiment Bottle"
				if (reagents.reagent_list.len==1)
					desc = "Looks like it is [reagents.get_master_reagent_name()], but you are not sure."
				else
					desc = "A mixture of various condiments. [reagents.get_master_reagent_name()] is one of them."
				icon_state = "mixedcondiments"
				center_of_mass = list("x"=16, "y"=6)
	else
		icon_state = "emptycondiment"
		name = "Condiment Bottle"
		desc = "An empty condiment bottle."
		center_of_mass = list("x"=16, "y"=6)

/obj/item/weapon/reagent_containers/condiment/enzyme
	name = "Universal Enzyme"
	desc = "Used in cooking various dishes."
	icon_state = "enzyme"
	preloaded = list("enzyme" = 50)

/obj/item/weapon/reagent_containers/condiment/sugar
	preloaded = list("sugar" = 50)

/obj/item/weapon/reagent_containers/condiment/small
	possible_transfer_amounts = list(1,20)
	amount_per_transfer_from_this = 1
	volume = 20

/obj/item/weapon/reagent_containers/condiment/small/on_reagent_change()
	return

//Seperate from above since it's a small shaker rather then a large one.
/obj/item/weapon/reagent_containers/condiment/small/saltshaker
	name = "salt shaker"
	desc = "Salt. From space oceans, presumably."
	icon_state = "saltshakersmall"
	preloaded = list("sodiumchloride" = 20)

/obj/item/weapon/reagent_containers/condiment/small/peppermill
	name = "pepper mill"
	desc = "Often used to flavor food or make people sneeze."
	icon_state = "peppermillsmall"
	preloaded = list("blackpepper" = 20)

/obj/item/weapon/reagent_containers/condiment/small/sugar
	name = "sugar"
	desc = "Sweetness in a bottle"
	icon_state = "sugarsmall"
	preloaded = list("sugar" = 20)

/obj/item/weapon/reagent_containers/condiment/flour
	name = "flour sack"
	desc = "A big bag of flour. Good for baking!"
	randpixel = 10
	icon = 'icons/obj/food.dmi'
	icon_state = "flour"
	item_state = "flour"
	preloaded = list("flour" = 30)

/obj/item/weapon/reagent_containers/condiment/flour/on_reagent_change()
	return