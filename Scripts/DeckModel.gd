extends Node
class_name Deck

@onready var deckName: String
@onready var cards: Array # [CardModel.gd]
@onready var cardCount = cards.size()

func _init(cards_p: Array):
	if(cards_p.size() == 0):
		cards = []
	deckName = "New Deck"
	cards = cards_p
