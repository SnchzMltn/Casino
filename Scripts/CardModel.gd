extends Node
class_name Card

enum CardTypeEnum { OFFENSIVE, DEFENSIVE } # todo: include TACTICAL?

@onready var cardName: String
#@onready var cardImage: String (file address?)
@onready var cardType: CardTypeEnum
@onready var cardEffect: CardEffect

func _init(name: String, type: CardTypeEnum, effect: CardEffect):
	cardName = name
	cardType = type
	cardEffect = effect
