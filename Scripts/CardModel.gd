extends Node2D
class_name Card

enum CardTypeEnum { OFFENSIVE, DEFENSIVE } # todo: include TACTICAL?

@export var cardName: String
#@onready var cardImage: String (file address?)
@export var cardType: CardTypeEnum
@export var cardEffect: CardEffect
@export var xCoordinate: float = 0.0 #todo: replace with transform.position?
@export var yCoordinate: float = 0.0 #todo: replace with transform.position?

# todo: Factory-style method
static func new_card(_card: Card) -> Node2D:
	var card_scene = preload("res://Gameplay/Scenes/MainGameLoop/Game/Cards/Card.tscn")
	var newCard := card_scene.instantiate()
	return newCard

func _init(_name: String, type: CardTypeEnum, effect: CardEffect):
	cardName = _name
	cardType = type
	cardEffect = effect
