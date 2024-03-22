extends Node
class_name CardEffect

var cardEffectObject = {}

func _is_effect_present():
	if (cardEffectObject.size() > 0):
		return true
	return false
