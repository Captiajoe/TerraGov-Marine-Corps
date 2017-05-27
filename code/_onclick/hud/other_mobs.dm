
//AI

/datum/hud/ai/New(mob/living/silicon/ai/owner)
	..()
	blind_icon = new /obj/screen/blind()
	screenoverlays += blind_icon

	flash_icon = new /obj/screen/flash()
	screenoverlays += flash_icon


/mob/living/silicon/ai/create_mob_hud()
	if(client && !hud_used)
		hud_used = new /datum/hud/ai(src)


//BRAIN

/datum/hud/brain/New(mob/living/carbon/brain/owner, ui_style='icons/mob/screen1_Midnight.dmi')
	..()
	blind_icon = new /obj/screen/blind()
	screenoverlays += blind_icon

/mob/living/carbon/brain/create_mob_hud()
	if(client && !hud_used)
		hud_used = new /datum/hud/brain(src)


//HELLHOUND

/datum/hud/hellhound/New(mob/living/carbon/hellhound/owner, ui_style = 'icons/mob/screen1_Midnight.dmi')
	..()
	var/obj/screen/using

	using = new /obj/screen/act_intent/corner()
	using.icon = ui_style
	using.icon_state = "intent_"+owner.a_intent
	using.screen_loc = ui_acti
	static_inventory += using
	action_intent = using

	using = new /obj/screen/drop()
	using.icon = ui_style
	using.screen_loc = ui_drop_throw
	static_inventory += using

	healths = new /obj/screen/healths()
	infodisplay += healths

	blind_icon = new /obj/screen/blind()
	screenoverlays += blind_icon

	flash_icon = new /obj/screen/flash()
	screenoverlays += flash_icon

	zone_sel = new /obj/screen/zone_sel()
	zone_sel.icon = ui_style
	zone_sel.update_icon(mymob)
	static_inventory += zone_sel

/mob/living/carbon/hellhound/create_mob_hud()
	if(client && !hud_used)
		hud_used = new /datum/hud/hellhound(src)