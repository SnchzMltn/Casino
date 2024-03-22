extends Node
class_name Card

enum CardTypeEnum { OFFENSIVE, DEFENSIVE } # todo: include TACTICAL?

@onready var cardName: String
@onready var cardType: CardTypeEnum
@onready var cardEffect: CardEffect
