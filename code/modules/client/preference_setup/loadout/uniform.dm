// Uniform slot
/datum/gear/uniform
	display_name = "blazer, blue"
	path = /obj/item/clothing/under/blazer
	slot = slot_w_uniform
	sort_category = "Uniforms and Dress"

/datum/gear/uniform/job_skirt
	display_name = "job, skirt"
	description = "Totally as your default uniform, but with skirt!"
	path = /obj/item/clothing/under

/datum/gear/uniform/job_skirt/spawn_for(var/mob/living/carbon/human/H)
	var/tmp_path = path
	switch(H.job)
		if("Captain")
			tmp_path = /obj/item/clothing/under/rank/captain/dress
		if("Head of Personal")
			tmp_path = /obj/item/clothing/under/rank/hop/dress
		if("QM")
			tmp_path = /obj/item/clothing/under/rank/qm/skirt
		if("Cargo Technician")
			tmp_path = /obj/item/clothing/under/rank/cargo/skirt
		if("Chief Engineer")
			tmp_path = /obj/item/clothing/under/rank/chief_engineer/skirt
		if("Station Engineer")
			tmp_path = /obj/item/clothing/under/rank/engineer/skirt
		if("Atmospheric Technician")
			tmp_path = /obj/item/clothing/under/rank/atmospheric_technician/skirt
		if("Roboticist")
			tmp_path = /obj/item/clothing/under/rank/roboticist/skirt
		if("Research Director")
			tmp_path = /obj/item/clothing/under/rank/research_director/skirt
		if("Scientist")
			tmp_path = /obj/item/clothing/under/rank/scientist/skirt
		if("Chief Medical Officer")
			tmp_path = /obj/item/clothing/under/rank/chief_medical_officer/skirt
		if("Chemist")
			tmp_path = /obj/item/clothing/under/rank/chemist/skirt
		if("Medical Doctor")
			tmp_path = /obj/item/clothing/under/rank/medical/skirt
			if(H.mind && H.mind.role_alt_title == "Virologist")
				tmp_path = /obj/item/clothing/under/rank/virologist/skirt
		if("Geneticist")
			tmp_path = /obj/item/clothing/under/rank/geneticist/skirt
		if("Head of Security")
			tmp_path = /obj/item/clothing/under/rank/head_of_security/skirt
		if("Warden")
			tmp_path = /obj/item/clothing/under/rank/warden/skirt
		if("Security Officer")
			tmp_path = /obj/item/clothing/under/rank/security/skirt
		else
			H << SPAN_WARN("Your current job does not permit you to spawn with [display_name]!")
			return null

	return new tmp_path(H)


/datum/gear/uniform/job_jeans
	display_name = "job, jeans"
	description = "Totally as your default uniform, but with jeans!"
	path = /obj/item/clothing/under

/datum/gear/uniform/job_jeans/spawn_for(var/mob/living/carbon/human/H)
	var/tmp_path = path
	switch(H.job)
		if("QM")
			tmp_path = /obj/item/clothing/under/rank/qm/jeans
		if("Cargo Technician")
			tmp_path = /obj/item/clothing/under/rank/cargo/jeans
		if("Station Engineer")
			tmp_path = /obj/item/clothing/under/rank/engineer/jeans
		if("Atmospheric Technician")
			tmp_path = /obj/item/clothing/under/rank/atmospheric_technician/jeans
		if("Scientist")
			tmp_path = /obj/item/clothing/under/rank/scientist/jeans
		if("Chief Medical Officer")
			tmp_path = /obj/item/clothing/under/rank/chief_medical_officer/jeans
		if("Chemist")
			tmp_path = /obj/item/clothing/under/rank/chemist/jeans
		if("Medical Doctor")
			tmp_path = /obj/item/clothing/under/rank/medical/jeans
			if(H.mind && H.mind.role_alt_title == "Virologist")
				tmp_path = /obj/item/clothing/under/rank/virologist/jeans
		if("Geneticist")
			tmp_path = /obj/item/clothing/under/rank/geneticist/jeans
		if("Head of Security")
			tmp_path = /obj/item/clothing/under/rank/head_of_security/jeans
		if("Warden")
			tmp_path = /obj/item/clothing/under/rank/warden/jeans
		if("Detective")
			tmp_path = /obj/item/clothing/under/rank/det/jeans
		else
			H << SPAN_WARN("Your current job does not permit you to spawn with [display_name]!")
			return null

	return new tmp_path(H)


/datum/gear/uniform/cheongsam
	display_name = "cheongsam"
	path = /obj/item/clothing/under/cheongsam
	options = list(
		"white" = /obj/item/clothing/under/cheongsam,
		"blue"  = /obj/item/clothing/under/cheongsam/blue,
		"red"   = /obj/item/clothing/under/cheongsam/red,
		"black" = /obj/item/clothing/under/cheongsam/black
	)

/datum/gear/uniform/kilt
	display_name = "kilt"
	path = /obj/item/clothing/under/kilt

/datum/gear/uniform/blackjumpskirt
	display_name = "jumpskirt, black"
	path = /obj/item/clothing/under/color/blackjumpskirt

/datum/gear/uniform/blackfjumpsuit
	display_name = "jumpsuit, female-black"
	path = /obj/item/clothing/under/color/blackf

/datum/gear/uniform/rainbow
	display_name = "jumpsuit, rainbow"
	path = /obj/item/clothing/under/color/rainbow

/datum/gear/uniform/SID
	display_name = "jumpsuit, SID"
	path = /obj/item/clothing/under/SID

/datum/gear/uniform/plaid_skirt
	display_name = "skirt, plaid"
	path = /obj/item/clothing/under/dress/plaid_blue
	options = list(
		"blue"   = /obj/item/clothing/under/dress/plaid_blue,
		"purple" = /obj/item/clothing/under/dress/plaid_purple,
		"red"    = /obj/item/clothing/under/dress/plaid_red,
		"black"  = /obj/item/clothing/under/dress/plaid_black
	)

/datum/gear/uniform/skirt_black
	display_name = "skirt, black"
	path = /obj/item/clothing/under/blackskirt

/datum/gear/uniform/pants/jeans
	display_name = "Pants (jeans)"
	path = /obj/item/clothing/under/pants/jeans
	options = list(
		"common"     = /obj/item/clothing/under/pants/jeans,
		"classic"    = /obj/item/clothing/under/pants/classicjeans,
		"must hang"  = /obj/item/clothing/under/pants/mustangjeans,
		"young folks"= /obj/item/clothing/under/pants/youngfolksjeans,
		"black"      = /obj/item/clothing/under/pants/blackjeans
	)

/datum/gear/uniform/pants/color
	display_name = "Pants (color)"
	path = /obj/item/clothing/under/pants/white
	options = list(
		"white" = /obj/item/clothing/under/pants/white,
		"red" = /obj/item/clothing/under/pants/red,
		"black" = /obj/item/clothing/under/pants/black,
		"track" = /obj/item/clothing/under/pants/track,
		"tan" = /obj/item/clothing/under/pants/tan,
		"khaki" = /obj/item/clothing/under/pants/khaki,
		"camo" = /obj/item/clothing/under/pants/camo,
	)

/datum/gear/uniform/suit  //amish
	display_name = "suit, amish"
	path = /obj/item/clothing/under/sl_suit

/datum/gear/uniform/suit/black
	display_name = "suit, black"
	path = /obj/item/clothing/under/suit_jacket

/datum/gear/uniform/suit/shinyblack
	display_name = "suit, shiny-black"
	path = /obj/item/clothing/under/lawyer/black

/datum/gear/uniform/suit/blue
	display_name = "suit, blue"
	path = /obj/item/clothing/under/lawyer/blue

/datum/gear/uniform/suit/burgundy
	display_name = "formal suit with jaket"
	path = /obj/item/clothing/under/with_suit/burgundy
	options = list(
		"burgundy" = /obj/item/clothing/under/with_suit/burgundy,
		"checkred" = /obj/item/clothing/under/with_suit/checkered,
		"charcoal" = /obj/item/clothing/under/with_suit/charcoal,
		"navy"     = /obj/item/clothing/under/with_suit/navy,
		"tan"      = /obj/item/clothing/under/with_suit/tan
	)

/datum/gear/uniform/suit/exec
	display_name = "suit, executive"
	path = /obj/item/clothing/under/really_black

/datum/gear/uniform/suit/femaleexec
	display_name = "suit, female-executive"
	path = /obj/item/clothing/under/suit_female

/datum/gear/uniform/suit/gentle
	display_name = "suit, gentlemen"
	path = /obj/item/clothing/under/gentlesuit

/datum/gear/uniform/suit/redlawyer
	display_name = "suit, lawyer-red"
	path = /obj/item/clothing/under/lawyer/red

/datum/gear/uniform/suit/oldman
	display_name = "suit, old-man"
	path = /obj/item/clothing/under/lawyer/oldman

/datum/gear/uniform/suit/purple
	display_name = "suit, purple"
	path = /obj/item/clothing/under/lawyer/purpsuit

/datum/gear/uniform/suit/white
	display_name = "suit, white"
	path = /obj/item/clothing/under/scratch

/datum/gear/uniform/suit/whiteblue
	display_name = "suit, white-blue"
	path = /obj/item/clothing/under/lawyer/bluesuit

/datum/gear/uniform/sundress
	display_name = "sundress"
	path = /obj/item/clothing/under/dress/sundress
	options = list(
		"black" = /obj/item/clothing/under/dress/sundress,
		"white" = /obj/item/clothing/under/dress/sundress_white
	)

/datum/gear/uniform/dress_fire
	display_name = "flame dress"
	path = /obj/item/clothing/under/dress/fire

/datum/gear/uniform/sec_blue
	display_name = "uniform, blue (Warden, Sec)"
	path = /obj/item/clothing/under/rank/security/blue

/datum/gear/uniform/sec_blue/spawn_for(var/mob/living/carbon/human/H)
	if(allowed_roles && !(H.job in allowed_roles))
		H << SPAN_WARN("Your current job does not permit you to spawn with [display_name]!")
		return null
	var/tmp_path = path
	if(H.job == "Warden")
		tmp_path = /obj/item/clothing/under/rank/warden/blue
	return new tmp_path ()

/datum/gear/uniform/corpsecsuit
	display_name = "uniform, corporate (Security)"
	path = /obj/item/clothing/under/rank/security/corp
	allowed_roles = list("Head of Security","Warden","Security Officer","Detective")

/datum/gear/uniform/corpsecsuit/spawn_for(var/mob/living/carbon/human/H)
	if(allowed_roles && !(H.job in allowed_roles))
		H << SPAN_WARN("Your current job does not permit you to spawn with [display_name]!")
		return null

	var/tmp_path = path
	switch(H.job)
		if("Head of Security")
			tmp_path = /obj/item/clothing/under/rank/head_of_security/corp
		if("Warden")
			tmp_path = /obj/item/clothing/under/rank/warden/corp
		if("Detective")
			tmp_path = /obj/item/clothing/under/rank/det/corp
	return new tmp_path ()

/datum/gear/uniform/uniform_hr
	display_name = "uniform, HR director (HoP)"
	path = /obj/item/clothing/under/rank/hop/dress/hr
	allowed_roles = list("Head of Personnel")

/datum/gear/uniform/dnavysecsuit
	display_name = "uniform, deep navy (Security)"
	path = /obj/item/clothing/under/rank/security/dnavy
	allowed_roles = list("Head of Security","Warden", "Security Officer")

/datum/gear/uniform/dnavysecsuit/spawn_for(var/mob/living/carbon/human/H)
	if(allowed_roles && !(H.job in allowed_roles))
		H << SPAN_WARN("Your current job does not permit you to spawn with [display_name]!")
		return null

	var/tmp_path = path
	switch(H.job)
		if("Head of Security")
			tmp_path = /obj/item/clothing/under/rank/head_of_security/dnavy
		if("Warden")
			tmp_path = /obj/item/clothing/under/rank/warden/dnavy
	return new tmp_path ()

/datum/gear/uniform/tansecsuit
	display_name = "uniform, tan (Security)"
	path = /obj/item/clothing/under/rank/security/tan
	allowed_roles = list("Head of Security","Warden", "Security Officer")

/datum/gear/uniform/tansecsuit/spawn_for(var/mob/living/carbon/human/H)
	if(allowed_roles && !(H.job in allowed_roles))
		H << SPAN_WARN("Your current job does not permit you to spawn with [display_name]!")
		return null

	var/tmp_path = path
	switch(H.job)
		if("Head of Security")
			tmp_path = /obj/item/clothing/under/rank/head_of_security/tan
		if("Warden")
			tmp_path = /obj/item/clothing/under/rank/warden/tan
	return new tmp_path ()

