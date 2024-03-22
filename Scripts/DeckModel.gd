extends Node
class_name Deck

@onready var deckName: String
@onready var cards: Array # [CardModel.gd]
@onready var cardCount = cards.size()

#todo: implement constructor
func _init():
	deckName = "New Deck"
	cards = []
