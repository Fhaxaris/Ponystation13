
#define ROBOTIC_LIGHT_BRUTE_MSG "marred"
#define ROBOTIC_MEDIUM_BRUTE_MSG "dented"
#define ROBOTIC_HEAVY_BRUTE_MSG "like its falling apart"
#define PONY_HEAD_SIZE_MODIFIER 1.5

#define ROBOTIC_LIGHT_BURN_MSG "scorched"
#define ROBOTIC_MEDIUM_BURN_MSG "charred"
#define ROBOTIC_HEAVY_BURN_MSG "smoldering"

//For ye whom may venture here, split up arm / hand sprites are formatted as "l_hand" & "l_arm".
//The complete sprite (displayed when the limb is on the ground) should be named "borg_l_arm".
//Failure to follow this pattern will cause the hand's icons to be missing due to the way get_limb_icon() works to generate the mob's icons using the aux_zone var.

/obj/item/bodypart/arm/left/robot
	name = "cyborg left arm"
	desc = "A skeletal limb wrapped in pseudomuscles, with a low-conductivity case."
	limb_id = BODYPART_ID_ROBOTIC
	attack_verb_simple = list("slapped", "punched")
	inhand_icon_state = "buildpipe"
	icon = 'icons/mob/augmentation/augments.dmi'
	icon_static = 'icons/mob/augmentation/augments.dmi'
	obj_flags = CONDUCTS_ELECTRICITY
	icon_state = "borg_l_arm"
	is_dimorphic = FALSE
	should_draw_greyscale = FALSE
	bodytype = BODYTYPE_ROBOTIC
	bodyshape = BODYSHAPE_HUMANOID
	change_exempt_flags = BP_BLOCK_CHANGE_SPECIES
	dmg_overlay_type = "robotic"

	brute_modifier = 0.8
	burn_modifier = 0.8

	light_brute_msg = ROBOTIC_LIGHT_BRUTE_MSG
	medium_brute_msg = ROBOTIC_MEDIUM_BRUTE_MSG
	heavy_brute_msg = ROBOTIC_HEAVY_BRUTE_MSG

	light_burn_msg = ROBOTIC_LIGHT_BURN_MSG
	medium_burn_msg = ROBOTIC_MEDIUM_BURN_MSG
	heavy_burn_msg = ROBOTIC_HEAVY_BURN_MSG

	biological_state = (BIO_ROBOTIC|BIO_JOINTED)

	damage_examines = list(BRUTE = ROBOTIC_BRUTE_EXAMINE_TEXT, BURN = ROBOTIC_BURN_EXAMINE_TEXT)
	disabling_threshold_percentage = 1
	bodypart_flags = BODYPART_UNHUSKABLE

/obj/item/bodypart/arm/right/robot
	name = "cyborg right arm"
	desc = "A skeletal limb wrapped in pseudomuscles, with a low-conductivity case."
	attack_verb_simple = list("slapped", "punched")
	inhand_icon_state = "buildpipe"
	icon_static = 'icons/mob/augmentation/augments.dmi'
	icon = 'icons/mob/augmentation/augments.dmi'
	limb_id = BODYPART_ID_ROBOTIC
	obj_flags = CONDUCTS_ELECTRICITY
	icon_state = "borg_r_arm"
	is_dimorphic = FALSE
	should_draw_greyscale = FALSE
	bodytype = BODYTYPE_ROBOTIC
	bodyshape = BODYSHAPE_HUMANOID
	change_exempt_flags = BP_BLOCK_CHANGE_SPECIES
	dmg_overlay_type = "robotic"

	brute_modifier = 0.8
	burn_modifier = 0.8

	disabling_threshold_percentage = 1

	light_brute_msg = ROBOTIC_LIGHT_BRUTE_MSG
	medium_brute_msg = ROBOTIC_MEDIUM_BRUTE_MSG
	heavy_brute_msg = ROBOTIC_HEAVY_BRUTE_MSG

	light_burn_msg = ROBOTIC_LIGHT_BURN_MSG
	medium_burn_msg = ROBOTIC_MEDIUM_BURN_MSG
	heavy_burn_msg = ROBOTIC_HEAVY_BURN_MSG

	biological_state = (BIO_ROBOTIC|BIO_JOINTED)

	damage_examines = list(BRUTE = ROBOTIC_BRUTE_EXAMINE_TEXT, BURN = ROBOTIC_BURN_EXAMINE_TEXT)
	bodypart_flags = BODYPART_UNHUSKABLE

/obj/item/bodypart/leg/left/robot
	name = "cyborg left leg"
	desc = "A skeletal limb wrapped in pseudomuscles, with a low-conductivity case."
	attack_verb_simple = list("kicked", "stomped")
	inhand_icon_state = "buildpipe"
	icon_static = 'icons/mob/augmentation/augments.dmi'
	icon = 'icons/mob/augmentation/augments.dmi'
	limb_id = BODYPART_ID_ROBOTIC
	obj_flags = CONDUCTS_ELECTRICITY
	icon_state = "borg_l_leg"
	is_dimorphic = FALSE
	should_draw_greyscale = FALSE
	bodytype = BODYTYPE_ROBOTIC
	bodyshape = BODYSHAPE_HUMANOID
	change_exempt_flags = BP_BLOCK_CHANGE_SPECIES
	dmg_overlay_type = "robotic"

	brute_modifier = 0.8
	burn_modifier = 0.8

	disabling_threshold_percentage = 1

	light_brute_msg = ROBOTIC_LIGHT_BRUTE_MSG
	medium_brute_msg = ROBOTIC_MEDIUM_BRUTE_MSG
	heavy_brute_msg = ROBOTIC_HEAVY_BRUTE_MSG

	light_burn_msg = ROBOTIC_LIGHT_BURN_MSG
	medium_burn_msg = ROBOTIC_MEDIUM_BURN_MSG
	heavy_burn_msg = ROBOTIC_HEAVY_BURN_MSG

	biological_state = (BIO_ROBOTIC|BIO_JOINTED)

	damage_examines = list(BRUTE = ROBOTIC_BRUTE_EXAMINE_TEXT, BURN = ROBOTIC_BURN_EXAMINE_TEXT)
	bodypart_flags = BODYPART_UNHUSKABLE

/obj/item/bodypart/leg/left/robot/emp_effect(severity, protection)
	. = ..()
	if(!. || isnull(owner))
		return

	var/knockdown_time = AUGGED_LEG_EMP_KNOCKDOWN_TIME
	if (severity == EMP_HEAVY)
		knockdown_time *= 2
	owner.Knockdown(knockdown_time)
	if(INCAPACITATED_IGNORING(owner, INCAPABLE_RESTRAINTS|INCAPABLE_GRAB)) // So the message isn't duplicated. If they were stunned beforehand by something else, then the message not showing makes more sense anyways.
		return
	to_chat(owner, span_danger("As your [plaintext_zone] unexpectedly malfunctions, it causes you to fall to the ground!"))
	return

/obj/item/bodypart/leg/right/robot
	name = "cyborg right leg"
	desc = "A skeletal limb wrapped in pseudomuscles, with a low-conductivity case."
	attack_verb_simple = list("kicked", "stomped")
	inhand_icon_state = "buildpipe"
	icon_static =  'icons/mob/augmentation/augments.dmi'
	icon = 'icons/mob/augmentation/augments.dmi'
	limb_id = BODYPART_ID_ROBOTIC
	obj_flags = CONDUCTS_ELECTRICITY
	icon_state = "borg_r_leg"
	is_dimorphic = FALSE
	should_draw_greyscale = FALSE
	bodytype = BODYTYPE_ROBOTIC
	bodyshape = BODYSHAPE_HUMANOID
	change_exempt_flags = BP_BLOCK_CHANGE_SPECIES
	dmg_overlay_type = "robotic"

	brute_modifier = 0.8
	burn_modifier = 0.8

	disabling_threshold_percentage = 1

	light_brute_msg = ROBOTIC_LIGHT_BRUTE_MSG
	medium_brute_msg = ROBOTIC_MEDIUM_BRUTE_MSG
	heavy_brute_msg = ROBOTIC_HEAVY_BRUTE_MSG

	light_burn_msg = ROBOTIC_LIGHT_BURN_MSG
	medium_burn_msg = ROBOTIC_MEDIUM_BURN_MSG
	heavy_burn_msg = ROBOTIC_HEAVY_BURN_MSG

	biological_state = (BIO_ROBOTIC|BIO_JOINTED)

	damage_examines = list(BRUTE = ROBOTIC_BRUTE_EXAMINE_TEXT, BURN = ROBOTIC_BURN_EXAMINE_TEXT)
	bodypart_flags = BODYPART_UNHUSKABLE

/obj/item/bodypart/leg/right/robot/emp_effect(severity, protection)
	. = ..()
	if(!. || isnull(owner))
		return

	var/knockdown_time = AUGGED_LEG_EMP_KNOCKDOWN_TIME
	if (severity == EMP_HEAVY)
		knockdown_time *= 2
	owner.Knockdown(knockdown_time)
	if(INCAPACITATED_IGNORING(owner, INCAPABLE_RESTRAINTS|INCAPABLE_GRAB)) // So the message isn't duplicated. If they were stunned beforehand by something else, then the message not showing makes more sense anyways.
		return
	to_chat(owner, span_danger("As your [plaintext_zone] unexpectedly malfunctions, it causes you to fall to the ground!"))
	return

/obj/item/bodypart/chest/robot
	name = "cyborg torso"
	desc = "A heavily reinforced case containing cyborg logic boards, with space for a standard power cell."
	inhand_icon_state = "buildpipe"
	icon_static =  'icons/mob/augmentation/augments.dmi'
	icon = 'icons/mob/augmentation/augments.dmi'
	limb_id = BODYPART_ID_ROBOTIC
	obj_flags = CONDUCTS_ELECTRICITY
	icon_state = "borg_chest"
	is_dimorphic = FALSE
	should_draw_greyscale = FALSE
	bodytype = BODYTYPE_ROBOTIC
	bodyshape = BODYSHAPE_HUMANOID
	change_exempt_flags = BP_BLOCK_CHANGE_SPECIES
	dmg_overlay_type = "robotic"

	brute_modifier = 0.8
	burn_modifier = 0.8

	light_brute_msg = ROBOTIC_LIGHT_BRUTE_MSG
	medium_brute_msg = ROBOTIC_MEDIUM_BRUTE_MSG
	heavy_brute_msg = ROBOTIC_HEAVY_BRUTE_MSG

	light_burn_msg = ROBOTIC_LIGHT_BURN_MSG
	medium_burn_msg = ROBOTIC_MEDIUM_BURN_MSG
	heavy_burn_msg = ROBOTIC_HEAVY_BURN_MSG

	biological_state = (BIO_ROBOTIC)

	damage_examines = list(BRUTE = ROBOTIC_BRUTE_EXAMINE_TEXT, BURN = ROBOTIC_BURN_EXAMINE_TEXT)
	bodypart_flags = BODYPART_UNHUSKABLE

	robotic_emp_paralyze_damage_percent_threshold = 0.6

	wing_types = list(/obj/item/organ/wings/functional/robotic)

	var/wired = FALSE
	var/obj/item/stock_parts/power_store/cell = null

/obj/item/bodypart/chest/robot/emp_effect(severity, protection)
	. = ..()
	if(!. || isnull(owner))
		return

	var/stun_time = 0
	var/shift_x = 3
	var/shift_y = 0
	var/shake_duration = AUGGED_CHEST_EMP_SHAKE_TIME

	if(severity == EMP_HEAVY)
		stun_time = AUGGED_CHEST_EMP_STUN_TIME

		shift_x = 5
		shift_y = 2

	var/damage_percent_to_max = (get_damage() / max_damage)
	if (stun_time && (damage_percent_to_max >= robotic_emp_paralyze_damage_percent_threshold))
		to_chat(owner, span_danger("Your [plaintext_zone]'s logic boards temporarily become unresponsive!"))
		owner.Stun(stun_time)
	owner.Shake(pixelshiftx = shift_x, pixelshifty = shift_y, duration = shake_duration)
	return

/obj/item/bodypart/chest/robot/get_cell()
	return cell

/obj/item/bodypart/chest/robot/Exited(atom/movable/gone, direction)
	. = ..()
	if(gone == cell)
		cell = null

/obj/item/bodypart/chest/robot/Destroy()
	QDEL_NULL(cell)
	UnregisterSignal(src, COMSIG_BODYPART_ATTACHED)
	return ..()

/obj/item/bodypart/chest/robot/Initialize(mapload)
	. = ..()
	RegisterSignal(src, COMSIG_BODYPART_ATTACHED, PROC_REF(on_attached))
	RegisterSignal(src, COMSIG_BODYPART_REMOVED, PROC_REF(on_detached))

/obj/item/bodypart/chest/robot/proc/on_attached(obj/item/bodypart/chest/robot/this_bodypart, mob/living/carbon/human/new_owner)
	SIGNAL_HANDLER

	RegisterSignals(new_owner, list(COMSIG_CARBON_POST_ATTACH_LIMB, COMSIG_CARBON_POST_REMOVE_LIMB), PROC_REF(check_limbs))

/obj/item/bodypart/chest/robot/proc/on_detached(obj/item/bodypart/chest/robot/this_bodypart, mob/living/carbon/human/old_owner)
	SIGNAL_HANDLER

	UnregisterSignal(old_owner, list(COMSIG_CARBON_POST_ATTACH_LIMB, COMSIG_CARBON_POST_REMOVE_LIMB))

/obj/item/bodypart/chest/robot/proc/check_limbs()
	SIGNAL_HANDLER

	var/all_robotic = TRUE
	for(var/obj/item/bodypart/part in owner.bodyparts)
		all_robotic = all_robotic && IS_ROBOTIC_LIMB(part)

	if(all_robotic)
		owner.add_traits(list(
			TRAIT_RESISTCOLD,
			TRAIT_RESISTHEAT,
			TRAIT_RESISTLOWPRESSURE,
			TRAIT_RESISTHIGHPRESSURE,
			), AUGMENTATION_TRAIT)
	else
		owner.remove_traits(list(
			TRAIT_RESISTCOLD,
			TRAIT_RESISTHEAT,
			TRAIT_RESISTLOWPRESSURE,
			TRAIT_RESISTHIGHPRESSURE,
			), AUGMENTATION_TRAIT)

/obj/item/bodypart/chest/robot/attackby(obj/item/weapon, mob/user, list/modifiers, list/attack_modifiers)
	if(istype(weapon, /obj/item/stock_parts/power_store/cell))
		if(cell)
			to_chat(user, span_warning("You have already inserted a cell!"))
			return
		else
			if(!user.transferItemToLoc(weapon, src))
				return
			cell = weapon
			to_chat(user, span_notice("You insert the cell."))
	else if(istype(weapon, /obj/item/stack/cable_coil))
		if(wired)
			to_chat(user, span_warning("You have already inserted wire!"))
			return
		var/obj/item/stack/cable_coil/coil = weapon
		if (coil.use(1))
			wired = TRUE
			to_chat(user, span_notice("You insert the wire."))
		else
			to_chat(user, span_warning("You need one length of coil to wire it!"))
	else
		return ..()

/obj/item/bodypart/chest/robot/wirecutter_act(mob/living/user, obj/item/cutter)
	. = ..()
	if(!wired)
		return
	. = TRUE
	cutter.play_tool_sound(src)
	to_chat(user, span_notice("You cut the wires out of [src]."))
	new /obj/item/stack/cable_coil(drop_location(), 1)
	wired = FALSE

/obj/item/bodypart/chest/robot/screwdriver_act(mob/living/user, obj/item/screwtool)
	..()
	. = TRUE
	if(!cell)
		to_chat(user, span_warning("There's no power cell installed in [src]!"))
		return
	screwtool.play_tool_sound(src)
	to_chat(user, span_notice("Remove [cell] from [src]."))
	cell.forceMove(drop_location())

/obj/item/bodypart/chest/robot/examine(mob/user)
	. = ..()
	if(cell)
		. += {"It has a [cell] inserted.\n
		[span_info("You can use a <b>screwdriver</b> to remove [cell].")]"}
	else
		. += span_info("It has an empty port for a <b>power cell</b>.")
	if(wired)
		. += "Its all wired up[cell ? " and ready for usage" : ""].\n"+\
		span_info("You can use <b>wirecutters</b> to remove the wiring.")
	else
		. += span_info("It has a couple spots that still need to be <b>wired</b>.")

/obj/item/bodypart/chest/robot/drop_organs(mob/user, violent_removal)
	var/atom/drop_loc = drop_location()
	if(wired)
		new /obj/item/stack/cable_coil(drop_loc, 1)
		wired = FALSE
	cell?.forceMove(drop_loc)
	return ..()

/obj/item/bodypart/head/robot
	name = "cyborg head"
	desc = "A standard reinforced braincase, with spine-plugged neural socket and sensor gimbals."
	inhand_icon_state = "buildpipe"
	icon_static = 'icons/mob/augmentation/augments.dmi'
	icon = 'icons/mob/augmentation/augments.dmi'
	limb_id = BODYPART_ID_ROBOTIC
	obj_flags = CONDUCTS_ELECTRICITY
	icon_state = "borg_head"
	is_dimorphic = FALSE
	should_draw_greyscale = FALSE
	bodytype = BODYTYPE_ROBOTIC
	bodyshape = BODYSHAPE_HUMANOID
	change_exempt_flags = BP_BLOCK_CHANGE_SPECIES
	dmg_overlay_type = "robotic"

	brute_modifier = 0.8
	burn_modifier = 0.8

	light_brute_msg = ROBOTIC_LIGHT_BRUTE_MSG
	medium_brute_msg = ROBOTIC_MEDIUM_BRUTE_MSG
	heavy_brute_msg = ROBOTIC_HEAVY_BRUTE_MSG

	light_burn_msg = ROBOTIC_LIGHT_BURN_MSG
	medium_burn_msg = ROBOTIC_MEDIUM_BURN_MSG
	heavy_burn_msg = ROBOTIC_HEAVY_BURN_MSG

	biological_state = (BIO_ROBOTIC)

	damage_examines = list(BRUTE = ROBOTIC_BRUTE_EXAMINE_TEXT, BURN = ROBOTIC_BURN_EXAMINE_TEXT)

	head_flags = HEAD_EYESPRITES
	bodypart_flags = BODYPART_UNHUSKABLE

	var/obj/item/assembly/flash/handheld/flash1 = null
	var/obj/item/assembly/flash/handheld/flash2 = null

#define EMP_GLITCH "EMP_GLITCH"

/obj/item/bodypart/head/robot/emp_effect(severity, protection)
	. = ..()
	if(!. || isnull(owner))
		return

	to_chat(owner, span_danger("Your [plaintext_zone]'s optical transponders glitch out and malfunction!"))

	var/glitch_duration = AUGGED_HEAD_EMP_GLITCH_DURATION
	if (severity == EMP_HEAVY)
		glitch_duration *= 2

	QDEL_IN(owner.add_client_colour(/datum/client_colour/malfunction, HEAD_TRAIT), glitch_duration)

#undef EMP_GLITCH

/obj/item/bodypart/head/robot/Exited(atom/movable/gone, direction)
	. = ..()
	if(gone == flash1)
		flash1 = null
	if(gone == flash2)
		flash2 = null

/obj/item/bodypart/head/robot/Destroy()
	QDEL_NULL(flash1)
	QDEL_NULL(flash2)
	return ..()

/obj/item/bodypart/head/robot/examine(mob/user)
	. = ..()
	if(!flash1 && !flash2)
		. += span_info("It has two empty eye sockets for <b>flashes</b>.")
	else
		var/single_flash = FALSE
		if(!flash1 || !flash2)
			single_flash = TRUE
			. += {"One of its eye sockets is currently occupied by a flash.\n
			[span_info("It has an empty eye socket for another <b>flash</b>.")]"}
		else
			. += "It has two eye sockets occupied by flashes."
		. += span_notice("You can remove the seated flash[single_flash ? "":"es"] with a <b>crowbar</b>.")

/obj/item/bodypart/head/robot/attackby(obj/item/weapon, mob/user, list/modifiers, list/attack_modifiers)
	if(istype(weapon, /obj/item/assembly/flash/handheld))
		var/obj/item/assembly/flash/handheld/flash = weapon
		if(flash1 && flash2)
			to_chat(user, span_warning("You have already inserted the eyes!"))
			return
		else if(flash.burnt_out)
			to_chat(user, span_warning("You can't use a broken flash!"))
			return
		else
			if(!user.transferItemToLoc(flash, src))
				return
			if(flash1)
				flash2 = flash
			else
				flash1 = flash
			to_chat(user, span_notice("You insert the flash into the eye socket."))
			return
	return ..()

/obj/item/bodypart/head/robot/crowbar_act(mob/living/user, obj/item/prytool)
	..()
	if(flash1 || flash2)
		prytool.play_tool_sound(src)
		to_chat(user, span_notice("You remove the flash from [src]."))
		flash1?.forceMove(drop_location())
		flash2?.forceMove(drop_location())
	else
		to_chat(user, span_warning("There is no flash to remove from [src]."))
	return TRUE

/obj/item/bodypart/head/robot/drop_organs(mob/user, violent_removal)
	var/atom/drop_loc = drop_location()
	flash1?.forceMove(drop_loc)
	flash2?.forceMove(drop_loc)
	return ..()

// Pony Robotic Limbs
// i am very lazy

/obj/item/bodypart/head/robot/pony
	name = "equid cyborg head"
	desc = "A standard reinforced equid braincase, with spine-plugged neural socket and sensor gimbals."
	icon_static = 'icons/mob/augmentation/pony_augments.dmi'
	icon = 'icons/mob/augmentation/pony_augments.dmi'
	limb_id = BODYPART_ID_ROBOPONY
	bodyshape = BODYSHAPE_PONY
	var/datum/worn_feature_offset/worn_mouth_item_offset

/obj/item/bodypart/head/robot/pony/Initialize(mapload)
	. = ..()
	QDEL_NULL(worn_face_offset)

	worn_ears_offset = new(
		attached_part = src,
		feature_key = OFFSET_EARS,
		offset_x = list("north" = -4, "south" = 4, "east" = 7, "west" = -7),
		offset_y = list("north" = 3, "south" = 3, "east" = 3, "west" = 3),
	)
	worn_glasses_offset = new(
		attached_part = src,
		feature_key = OFFSET_GLASSES,
		offset_x = list("north" = 0, "south" = 0, "east" = 6, "west" = -6),
		offset_y = list("north" = -7, "south" = -7, "east" = -7, "west" = -7),
		size_modifier = list("north" = PONY_HEAD_SIZE_MODIFIER, "south" = PONY_HEAD_SIZE_MODIFIER, "east" = PONY_HEAD_SIZE_MODIFIER, "west" = PONY_HEAD_SIZE_MODIFIER)
	)
	worn_head_offset = new(
		attached_part = src,
		feature_key = OFFSET_HEAD,
		offset_x = list("north" = 0, "south" = 0, "east" = 6, "west" = -6),
		offset_y = list("north" = -7, "south" = -7, "east" = -7, "west" = -7),
		size_modifier = list("north" = PONY_HEAD_SIZE_MODIFIER, "south" = PONY_HEAD_SIZE_MODIFIER, "east" = PONY_HEAD_SIZE_MODIFIER, "west" = PONY_HEAD_SIZE_MODIFIER)
	)
	worn_mask_offset = new(
		attached_part = src,
		feature_key = OFFSET_FACEMASK,
		offset_x = list("north" = 0, "south" = 0, "east" = 8, "west" = -8),
		offset_y = list("north" = -6, "south" = -6, "east" = -6, "west" = -6),
		size_modifier = list("north" = PONY_HEAD_SIZE_MODIFIER, "south" = PONY_HEAD_SIZE_MODIFIER, "east" = PONY_HEAD_SIZE_MODIFIER, "west" = PONY_HEAD_SIZE_MODIFIER)
	)
	worn_face_offset = new(
		attached_part = src,
		feature_key = OFFSET_FACE,
		offset_x = list("north" = 0, "south" = 0, "east" = 5, "west" = -5),
		offset_y = list("north" = -5, "south" = -6, "east" = -6, "west" = -6),
		size_modifier = list("north" = PONY_HEAD_SIZE_MODIFIER, "south" = PONY_HEAD_SIZE_MODIFIER, "east" = PONY_HEAD_SIZE_MODIFIER, "west" = PONY_HEAD_SIZE_MODIFIER)
	)

/obj/item/bodypart/chest/robot/pony
	name = "equid cyborg torso"
	desc = "A heavily reinforced equid case containing cyborg logic boards, with space for a standard power cell."
	inhand_icon_state = "buildpipe"
	icon_static = 'icons/mob/augmentation/pony_augments.dmi'
	icon = 'icons/mob/augmentation/pony_augments.dmi'
	limb_id = BODYPART_ID_ROBOPONY
	bodyshape = BODYSHAPE_PONY

/obj/item/bodypart/chest/robot/pony/on_adding(mob/living/carbon/new_owner)
	. = ..()
	new_owner.hug_verb = "nudge"
	RegisterSignal(new_owner, COMSIG_MOB_UPDATE_HELD_ITEMS, PROC_REF(on_updated_held_items))
	RegisterSignal(new_owner, COMSIG_CARBON_POST_REMOVE_LIMB, PROC_REF(on_removed_limb))

/obj/item/bodypart/chest/robot/pony/on_removal(mob/living/carbon/old_owner)
	. = ..()
	old_owner.hug_verb = initial(old_owner.hug_verb)
	UnregisterSignal(old_owner, COMSIG_MOB_UPDATE_HELD_ITEMS)
	UnregisterSignal(old_owner, COMSIG_CARBON_POST_REMOVE_LIMB)

/obj/item/bodypart/chest/robot/pony/proc/update_movespeed(mob/living/holding_mob)
	holding_mob.remove_movespeed_modifier(/datum/movespeed_modifier/pony_holding_no_items)
	holding_mob.remove_movespeed_modifier(/datum/movespeed_modifier/pony_holding_two_items)
	if(HAS_TRAIT(holding_mob, TRAIT_FLOATING_HELD) && holding_mob.num_hands == 2)
		holding_mob.add_movespeed_modifier(/datum/movespeed_modifier/pony_holding_no_items)
		return
	var/amount_of_held_items = 0
	for(var/obj/item/held in holding_mob.held_items)
		amount_of_held_items++
	if(amount_of_held_items >= 2 || holding_mob.num_hands == 0) // no front legs, gonna have a hard time getting around
		holding_mob.add_movespeed_modifier(/datum/movespeed_modifier/pony_holding_two_items)
	else if(amount_of_held_items == 0 && holding_mob.num_hands == 2) // still got both of your front legs
		holding_mob.add_movespeed_modifier(/datum/movespeed_modifier/pony_holding_no_items)

/obj/item/bodypart/chest/robot/pony/proc/on_updated_held_items(mob/living/holding_mob)
	SIGNAL_HANDLER
	update_movespeed(holding_mob)

/obj/item/bodypart/chest/robot/pony/proc/on_removed_limb(datum/source, obj/item/bodypart/removed_limb, special, dismembered, mob/living/carbon/limb_owner)
	SIGNAL_HANDLER
	update_movespeed(limb_owner)

/obj/item/bodypart/chest/robot/pony/Initialize(mapload)
	. = ..()
	worn_back_offset = new(
		attached_part = src,
		feature_key = OFFSET_BACK,
		offset_x = list("north" = 0, "south" = 0, "east" = 2, "west" = -2),
		offset_y = list("north" = -4, "south" = -4, "east" = -5, "west" = -5),
	)
	worn_belt_offset = new(
		attached_part = src,
		feature_key = OFFSET_BELT,
		offset_x = list("north" = 0, "south" = 0, "east" = 2, "west" = -2),
		offset_y = list("north" = -4, "south" = -4, "east" = -5, "west" = -5),
		rotation_modifier = list("north" = 0, "south" = 0, "east" = 90, "west" = -90)
	)
	worn_suit_storage_offset = new(
		attached_part = src,
		feature_key = OFFSET_S_STORE,
		offset_x = list("north" = 0, "south" = 0, "east" = 2, "west" = -2),
		offset_y = list("north" = -4, "south" = -4, "east" = -5, "west" = -5),
		rotation_modifier = list("north" = 0, "south" = 0, "east" = 90, "west" = -90)
	)
	worn_id_offset = new(
		attached_part = src,
		feature_key = OFFSET_ID,
		offset_x = list("north" = 0, "south" = 0, "east" = 0, "west" = 0),
		offset_y = list("north" = 0, "south" = 0, "east" = 0, "west" = 5),
	)
	worn_suit_offset = new(
		attached_part = src,
		feature_key = OFFSET_SUIT,
		offset_x = list("north" = 0, "south" = 0, "east" = 6, "west" = -6),
		offset_y = list("north" = -5, "south" = -6, "east" = -5, "west" = -5),
	)

/obj/item/bodypart/arm/left/robot/pony
    name = "cyborg left foreleg"
    desc = "A skeletal limb wrapped in pseudomuscles, with a low-conductivity case. Intended for equids."
    icon_static = 'icons/mob/augmentation/pony_augments.dmi'
    icon = 'icons/mob/augmentation/pony_augments.dmi'
    unarmed_attack_verbs = list("kick", "hoof", "stomp")
    grappled_attack_verb = "stomp"
    limb_id = BODYPART_ID_ROBOPONY
    bodyshape = BODYSHAPE_PONY

/obj/item/bodypart/arm/left/robot/pony/Initialize(mapload)
	. = ..()
	worn_glove_offset = new(
		attached_part = src,
		feature_key = OFFSET_GLOVES,
		offset_x = list("north" = 0, "south" = 0, "east" = 5, "west" = -5),
		offset_y = list("north" = 0, "south" = 0, "east" = 0, "west" = 0),
	)
	held_hand_offset = new(
		attached_part = src,
		feature_key = OFFSET_HELD,
		offset_x = list("north" = 4, "south" = -4, "east" = 3, "west" = -5),
		offset_y = list("north" = -9, "south" = -9, "east" = -9, "west" = -9),
	)

/obj/item/bodypart/arm/right/robot/pony
    name = "cyborg right foreleg"
    desc = "A skeletal limb wrapped in pseudomuscles, with a low-conductivity case. Intended for equids."
    icon_static = 'icons/mob/augmentation/pony_augments.dmi'
    icon = 'icons/mob/augmentation/pony_augments.dmi'
    unarmed_attack_verbs = list("kick", "hoof", "stomp")
    grappled_attack_verb = "stomp"
    limb_id = BODYPART_ID_ROBOPONY
    bodyshape = BODYSHAPE_PONY

/obj/item/bodypart/arm/right/robot/pony/Initialize(mapload)
	. = ..()
	worn_glove_offset = new( // even though they can't wear gloves. we're cheating and using this for the front leg offsets
		attached_part = src,
		feature_key = OFFSET_GLOVES,
		offset_x = list("north" = -1, "south" = -1, "east" = 5, "west" = -5),
		offset_y = list("north" = 0, "south" = 0, "east" = 0, "west" = 0),
	)
	held_hand_offset = new(
		attached_part = src,
		feature_key = OFFSET_HELD,
		offset_x = list("north" = -3, "south" = 3, "east" = 5, "west" = 0),
		offset_y = list("north" = -9, "south" = -9, "east" = -9, "west" = -9),
	)

/obj/item/bodypart/leg/left/robot/pony
	name = "cyborg left hindleg"
	desc = "A skeletal limb wrapped in pseudomuscles, with a low-conductivity case. Intended for equids."
	icon_static = 'icons/mob/augmentation/pony_augments.dmi'
	icon = 'icons/mob/augmentation/pony_augments.dmi'
	bodyshape = BODYSHAPE_PONY
	limb_id = BODYPART_ID_ROBOPONY
	footstep_type = FOOTSTEP_MOB_HOOF

/obj/item/bodypart/leg/left/robot/pony/Initialize(mapload)
	. = ..()
	worn_foot_offset = new(
		attached_part = src,
		feature_key = OFFSET_SHOES,
		offset_x = list("north" = 0, "south" = 0, "east" = -4, "west" = 4),
		offset_y = list("north" = 0, "south" = 0, "east" = 0, "west" = 0),
	)

/obj/item/bodypart/leg/right/robot/pony
	name = "cyborg right hindleg"
	desc = "A skeletal limb wrapped in pseudomuscles, with a low-conductivity case. Intended for equids."
	icon_static = 'icons/mob/augmentation/pony_augments.dmi'
	icon = 'icons/mob/augmentation/pony_augments.dmi'
	bodyshape = BODYSHAPE_PONY
	limb_id = BODYPART_ID_ROBOPONY
	footstep_type = FOOTSTEP_MOB_HOOF

/obj/item/bodypart/leg/right/robot/pony/Initialize(mapload)
	. = ..()
	worn_foot_offset = new(
		attached_part = src,
		feature_key = OFFSET_SHOES,
		offset_x = list("north" = 0, "south" = 0, "east" = -4, "west" = 4),
		offset_y = list("north" = 0, "south" = 0, "east" = 0, "west" = 0),
	)

// Prosthetics - Cheap, mediocre, and worse than organic limbs
// Actively make you less healthy by being on your body, contributing a whopping 250% to overall health at only 20 max health
// They also suck to punch with.

/obj/item/bodypart/arm/left/robot/surplus
	name = "surplus prosthetic left arm"
	desc = "A skeletal, robotic limb. Outdated and fragile, but it's still better than nothing."
	icon_static = 'icons/mob/augmentation/surplus_augments.dmi'
	icon = 'icons/mob/augmentation/surplus_augments.dmi'
	burn_modifier = 1
	brute_modifier = 1
	unarmed_damage_low = 1
	unarmed_damage_high = 5
	unarmed_effectiveness = 0 //Bro, you look huge.
	max_damage = LIMB_MAX_HP_PROSTHESIS
	body_damage_coeff = LIMB_BODY_DAMAGE_COEFFICIENT_PROSTHESIS

	biological_state = (BIO_METAL|BIO_JOINTED)

/obj/item/bodypart/arm/right/robot/surplus
	name = "surplus prosthetic right arm"
	desc = "A skeletal, robotic limb. Outdated and fragile, but it's still better than nothing."
	icon_static = 'icons/mob/augmentation/surplus_augments.dmi'
	icon = 'icons/mob/augmentation/surplus_augments.dmi'
	burn_modifier = 1
	brute_modifier = 1
	unarmed_damage_low = 1
	unarmed_damage_high = 5
	unarmed_effectiveness = 0
	max_damage = LIMB_MAX_HP_PROSTHESIS
	body_damage_coeff = LIMB_BODY_DAMAGE_COEFFICIENT_PROSTHESIS

	biological_state = (BIO_METAL|BIO_JOINTED)

/obj/item/bodypart/leg/left/robot/surplus
	name = "surplus prosthetic left leg"
	desc = "A skeletal, robotic limb. Outdated and fragile, but it's still better than nothing."
	icon_static = 'icons/mob/augmentation/surplus_augments.dmi'
	icon = 'icons/mob/augmentation/surplus_augments.dmi'
	brute_modifier = 1
	burn_modifier = 1
	unarmed_damage_low = 2
	unarmed_damage_high = 10
	unarmed_effectiveness = 0
	max_damage = LIMB_MAX_HP_PROSTHESIS
	body_damage_coeff = LIMB_BODY_DAMAGE_COEFFICIENT_PROSTHESIS

	biological_state = (BIO_METAL|BIO_JOINTED)

/obj/item/bodypart/leg/right/robot/surplus
	name = "surplus prosthetic right leg"
	desc = "A skeletal, robotic limb. Outdated and fragile, but it's still better than nothing."
	icon_static = 'icons/mob/augmentation/surplus_augments.dmi'
	icon = 'icons/mob/augmentation/surplus_augments.dmi'
	brute_modifier = 1
	burn_modifier = 1
	unarmed_damage_low = 2
	unarmed_damage_high = 10
	unarmed_effectiveness = 0
	max_damage = LIMB_MAX_HP_PROSTHESIS
	body_damage_coeff = LIMB_BODY_DAMAGE_COEFFICIENT_PROSTHESIS

	biological_state = (BIO_METAL|BIO_JOINTED)

// Pony Surplus
/obj/item/bodypart/arm/left/robot/pony/surplus
	name = "surplus prosthetic left foreleg"
	desc = "A skeletal, robotic limb. Outdated and fragile, but it's still better than nothing. Fit for equids."
	icon_static = 'icons/mob/augmentation/ponysurplus_augments.dmi'
	icon = 'icons/mob/augmentation/ponysurplus_augments.dmi'
	burn_modifier = 1
	brute_modifier = 1
	unarmed_damage_low = 1
	unarmed_damage_high = 5
	unarmed_effectiveness = 0
	max_damage = LIMB_MAX_HP_PROSTHESIS
	body_damage_coeff = LIMB_BODY_DAMAGE_COEFFICIENT_PROSTHESIS
	biological_state = (BIO_METAL|BIO_JOINTED)

/obj/item/bodypart/arm/right/robot/pony/surplus
	name = "surplus prosthetic right foreleg"
	desc = "A skeletal, robotic limb. Outdated and fragile, but it's still better than nothing. Fit for equids."
	icon_static = 'icons/mob/augmentation/ponysurplus_augments.dmi'
	icon = 'icons/mob/augmentation/ponysurplus_augments.dmi'
	burn_modifier = 1
	brute_modifier = 1
	unarmed_damage_low = 1
	unarmed_damage_high = 5
	unarmed_effectiveness = 0
	max_damage = LIMB_MAX_HP_PROSTHESIS
	body_damage_coeff = LIMB_BODY_DAMAGE_COEFFICIENT_PROSTHESIS
	biological_state = (BIO_METAL|BIO_JOINTED)

/obj/item/bodypart/leg/left/robot/pony/surplus
	name = "surplus prosthetic left hindleg"
	desc = "A skeletal, robotic limb. Outdated and fragile, but it's still better than nothing. Fit for equids."
	icon_static = 'icons/mob/augmentation/ponysurplus_augments.dmi'
	icon = 'icons/mob/augmentation/ponysurplus_augments.dmi'
	brute_modifier = 1
	burn_modifier = 1
	unarmed_damage_low = 2
	unarmed_damage_high = 10
	unarmed_effectiveness = 0
	max_damage = LIMB_MAX_HP_PROSTHESIS
	body_damage_coeff = LIMB_BODY_DAMAGE_COEFFICIENT_PROSTHESIS
	biological_state = (BIO_METAL|BIO_JOINTED)

/obj/item/bodypart/leg/right/robot/pony/surplus
	name = "surplus prosthetic right hindleg"
	desc = "A skeletal, robotic limb. Outdated and fragile, but it's still better than nothing. Fit for equids."
	icon_static = 'icons/mob/augmentation/ponysurplus_augments.dmi'
	icon = 'icons/mob/augmentation/ponysurplus_augments.dmi'
	brute_modifier = 1
	burn_modifier = 1
	unarmed_damage_low = 2
	unarmed_damage_high = 10
	unarmed_effectiveness = 0
	max_damage = LIMB_MAX_HP_PROSTHESIS
	body_damage_coeff = LIMB_BODY_DAMAGE_COEFFICIENT_PROSTHESIS
	biological_state = (BIO_METAL|BIO_JOINTED)

// Advanced Limbs: More durable, high punching force

/obj/item/bodypart/arm/left/robot/advanced
	name = "advanced robotic left arm"
	desc = "An advanced cybernetic arm, capable of greater feats of strength and durability."
	icon_static = 'icons/mob/augmentation/advanced_augments.dmi'
	icon = 'icons/mob/augmentation/advanced_augments.dmi'
	unarmed_damage_low = 5
	unarmed_damage_high = 13
	unarmed_effectiveness = 20
	max_damage = LIMB_MAX_HP_ADVANCED
	body_damage_coeff = LIMB_BODY_DAMAGE_COEFFICIENT_ADVANCED
	is_emissive = TRUE

/obj/item/bodypart/arm/right/robot/advanced
	name = "advanced robotic right arm"
	desc = "An advanced cybernetic arm, capable of greater feats of strength and durability."
	icon_static = 'icons/mob/augmentation/advanced_augments.dmi'
	icon = 'icons/mob/augmentation/advanced_augments.dmi'
	unarmed_damage_low = 5
	unarmed_damage_high = 13
	unarmed_effectiveness = 20
	max_damage = LIMB_MAX_HP_ADVANCED
	body_damage_coeff = LIMB_BODY_DAMAGE_COEFFICIENT_ADVANCED
	is_emissive = TRUE

/obj/item/bodypart/leg/left/robot/advanced
	name = "advanced robotic left leg"
	desc = "An advanced cybernetic leg, capable of greater feats of strength and durability."
	icon_static = 'icons/mob/augmentation/advanced_augments.dmi'
	icon = 'icons/mob/augmentation/advanced_augments.dmi'
	unarmed_damage_low = 7
	unarmed_damage_high = 17
	unarmed_effectiveness = 20
	max_damage = LIMB_MAX_HP_ADVANCED
	body_damage_coeff = LIMB_BODY_DAMAGE_COEFFICIENT_ADVANCED
	is_emissive = TRUE

/obj/item/bodypart/leg/right/robot/advanced
	name = "advanced robotic right leg"
	desc = "An advanced cybernetic leg, capable of greater feats of strength and durability."
	icon_static = 'icons/mob/augmentation/advanced_augments.dmi'
	icon = 'icons/mob/augmentation/advanced_augments.dmi'
	unarmed_damage_low = 7
	unarmed_damage_high = 17
	unarmed_effectiveness = 20
	max_damage = LIMB_MAX_HP_ADVANCED
	body_damage_coeff = LIMB_BODY_DAMAGE_COEFFICIENT_ADVANCED
	is_emissive = TRUE

#undef ROBOTIC_LIGHT_BRUTE_MSG
#undef ROBOTIC_MEDIUM_BRUTE_MSG
#undef ROBOTIC_HEAVY_BRUTE_MSG

#undef ROBOTIC_LIGHT_BURN_MSG
#undef ROBOTIC_MEDIUM_BURN_MSG
#undef ROBOTIC_HEAVY_BURN_MSG