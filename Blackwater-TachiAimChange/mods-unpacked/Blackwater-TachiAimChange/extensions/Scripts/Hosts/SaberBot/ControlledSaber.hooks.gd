extends Object

func get_stab_target_point(chain: ModLoaderHookChain):
	var base_obj = chain.reference_object
	var point = base_obj.target_point + ( 4 * (base_obj.global_position - base_obj.target_point) * ((2 * int(SaveManager.tachi_aim_invert)) - 1) )
	return point
