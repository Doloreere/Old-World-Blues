/obj/machinery/bluespace_beacon

	icon = 'icons/obj/objects.dmi'
	icon_state = "floor_beaconf"
	name = "Bluespace Gigabeacon"
	desc = "A device that draws power from bluespace and creates a permanent tracking beacon."
	level = 1		// underfloor
	layer = 2.5
	anchored = 1
	use_power = 1
	idle_power_usage = 0
	var/obj/item/device/radio/beacon/Beacon

	initialize()
		. = ..()
		var/turf/T = loc
		Beacon = new /obj/item/device/radio/beacon(T)
		Beacon.invisibility = INVISIBILITY_MAXIMUM

		hide(T.intact)

	Destroy()
		if(Beacon)
			qdel(Beacon)
		..()

	// update the invisibility and icon
	hide(var/intact)
		invisibility = intact ? 101 : 0
		updateicon()

	// update the icon_state
	proc/updateicon()
		var/state="floor_beacon"

		if(invisibility)
			icon_state = "[state]f"

		else
			icon_state = "[state]"

	process()
		if(!Beacon)
			var/turf/T = loc
			Beacon = new /obj/item/device/radio/beacon(T)
			Beacon.invisibility = INVISIBILITY_MAXIMUM
		if(Beacon)
			if(Beacon.loc != loc)
				Beacon.forceMove(loc)

		updateicon()


