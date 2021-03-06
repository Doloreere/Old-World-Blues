/obj/machinery/computer/shuttle
	name = "Shuttle"
	desc = "For shuttle control."
	screen_icon = "shuttle"
	light_color = "#00ffff"
	var/auth_need = 3.0
	var/list/authorized = list(  )


	attackby(var/obj/item/weapon/card/W as obj, var/mob/user as mob)
		if(stat & (BROKEN|NOPOWER))	return
		if (!ticker || emergency_shuttle.location() || !user)
			return
		if (W.GetIdCard())
			var/obj/item/weapon/card/id/ID = W.GetIdCard()
			var/list/cardaccess = ID.access
			if(!istype(cardaccess, /list) || !cardaccess.len) //no access
				user << "The access level of [W:registered_name]\'s card is not high enough. "
				return

			if(!(access_heads in ID.access)) //doesn't have this access
				user << "The access level of [W:registered_name]\'s card is not high enough. "
				return 0

			var/choice = alert(user, text("Would you like to (un)authorize a shortened launch time? [] authorization\s are still needed. Use abort to cancel all authorizations.", src.auth_need - src.authorized.len), "Shuttle Launch", "Authorize", "Repeal", "Abort")
			if(emergency_shuttle.location() && user.get_active_hand() != W)
				return 0
			switch(choice)
				if("Authorize")
					src.authorized -= ID.registered_name
					src.authorized += ID.registered_name
					if (src.auth_need - src.authorized.len > 0)
						log_game("[user.ckey] has authorized early shuttle launch", src)
						world << SPAN_NOTE("<b>Alert: [src.auth_need - src.authorized.len] authorizations needed until shuttle is launched early</b>")
					else
						log_game("[user.ckey] has launched the shuttle early")
						world << SPAN_NOTE("<b>Alert: Shuttle launch time shortened to 10 seconds!</b>")
						emergency_shuttle.set_launch_countdown(10)
						//src.authorized = null
						qdel(src.authorized)
						src.authorized = list(  )

				if("Repeal")
					src.authorized -= ID.registered_name
					world << SPAN_NOTE("<b>Alert: [src.auth_need - src.authorized.len] authorizations needed until shuttle is launched early</b>")

				if("Abort")
					world << SPAN_NOTE("<b>All authorizations to shortening time for shuttle launch have been revoked!</b>")
					src.authorized.len = 0
					src.authorized = list(  )

		else if (istype(W, /obj/item/weapon/card/emag) && !emagged)
			var/choice = alert(user, "Would you like to launch the shuttle?","Shuttle control", "Launch", "Cancel")

			if(!emagged && !emergency_shuttle.location() && user.get_active_hand() == W)
				switch(choice)
					if("Launch")
						world << SPAN_NOTE("<b>Alert: Shuttle launch time shortened to 10 seconds!</b>")
						emergency_shuttle.set_launch_countdown(10)
						emagged = 1
					if("Cancel")
						return
		return
