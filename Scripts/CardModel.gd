extends Node
class_name Card

enum CardTypeEnum { OFFENSIVE, DEFENSIVE } # todo: include TACTICAL?

@export var cardName: String
#@onready var cardImage: String (file address?)
@export var cardType: CardTypeEnum
@export var cardEffect: CardEffect
@export var xCoordinate: float = 0.0 #todo: replace with transform.position?
@export var yCoordinate: float = 0.0 #todo: replace with transform.position?

func _init(name: String, type: CardTypeEnum, effect: CardEffect):
	cardName = name
	cardType = type
	cardEffect = effect
