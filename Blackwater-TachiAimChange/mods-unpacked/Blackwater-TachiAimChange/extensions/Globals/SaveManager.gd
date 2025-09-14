extends "res://Globals/SaveManager.gd"

const TACHI_AIM_INVERT_KEY = "tachi_aim_invert"
const TACHI_AIM_INVERT_DEFAULT = false # By default, aim is NOT inverted, as anyone who installed this probably doesn't want the vanilla controls

var tachi_aim_invert = TACHI_AIM_INVERT_DEFAULT


func serialize() -> Dictionary:
	var result = super()
	result[TACHI_AIM_INVERT_KEY] = tachi_aim_invert
	return result

func deserialize_v2(save_data : Variant):
	tachi_aim_invert = save_data.get(TACHI_AIM_INVERT_KEY, TACHI_AIM_INVERT_DEFAULT)
	return super(save_data)

