extends Node2D
class_name Card

enum CardTypeEnum { OFFENSIVE, DEFENSIVE } # todo: include TACTICAL?

@export var cardName: String
#@onready var cardImage: String (file address?)
@export var cardType: CardTypeEnum
@export var cardEffect: CardEffect
@export var cardIndex: int

static func new_card(_card: Card) -> Card:
	var packedScene : Node2D = preload("res://Gameplay/Scenes/MainGameLoop/Game/Cards/Card.tscn").instantiate(PackedScene.GEN_EDIT_STATE_INSTANCE)
	packedScene.set("cardName", _card.cardName)
	packedScene.set("cardType", _card.cardType)
	packedScene.set("cardEffect", _card.cardEffect)
	return packedScene

func _init(_name: String, type: CardTypeEnum, effect: CardEffect):
	cardName = _name
	cardType = type
	cardEffect = effect

func _on_mouse_hover_test():
	print(get_local_mouse_position(), get_global_mouse_position())
