// Originally a debug verb, made it a proper adminverb for ~fun~
ADMIN_VERB_ADD(/client/proc/makePAI, R_DEBUG)
/client/proc/makePAI(turf/t in view(), name as text, pai_key as null|text)
	set name = "Make pAI"
	set category = "Debug"

	if(!check_rights(R_DEBUG))
		return

	if(!pai_key)
		var/client/C = input("Select client") as null|anything in clients
		if(!C) return
		pai_key = C.key

	log_and_message_admins("made a pAI with key=[pai_key] at ([t.x],[t.y],[t.z])")
	var/obj/item/device/paicard/card = new(t)
	var/mob/living/silicon/pai/pai = new(card)
	pai.key = pai_key
	card.setPersonality(pai)

	if(name)
		pai.SetName(name)
