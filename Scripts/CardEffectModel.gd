extends Node
class_name CardEffect

var cardEffectObject = {}

func _init(effect: Dictionary):
	cardEffectObject = effect

func _is_effect_empty():
	return cardEffectObject.is_empty()
