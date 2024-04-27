extends Node
class_name GameScript

@onready var backgroundNode: Node2D = get_node("./Background")
@onready var foregroundNode: Node2D = get_node("./Foreground")

@onready var pitch: Pitch
@onready var playerDeck: Deck
@onready var oponentDeck: Deck
@onready var playerHand: Array
@onready var oponentHand: Array
@onready var playerScore: int
@onready var oponentScore: int
@onready var gameTimer: Timer
@onready var turn: int
@onready var turnTimer: Timer

func _init():
	pitch = Pitch.new()
	playerDeck = Deck.new(DefaultDecks._get_random_card_array())
	oponentDeck = Deck.new(DefaultDecks._get_random_card_array())
	playerHand = _serveCardsToPlayers(playerDeck)
	oponentHand = _serveCardsToPlayers(oponentDeck)
	playerScore = 0
	oponentScore = 0
	gameTimer = Timer.new()
	gameTimer.wait_time = 100.0 # seconds for the game
	gameTimer.one_shot = true
	gameTimer.autostart = true
	turn = 0
	turnTimer = Timer.new()
	gameTimer.one_shot = true
	
	for card in playerHand:
		var cardInstance := Card.new(card.Name, card.CardType, card.CardEffect)
		# todo: expected to add a card isntance to the Foreground scene...
		# there must be some way to update the scene or something...
		foregroundNode.add_child(cardInstance)

func _serveCardsToPlayers(deck: Deck):
	return deck.cards.slice(0, 5)

#todo: implement
func _takeTurn(cardPlayed: Card):
	pass

func _process(delta):
	# process mouse (cursor) -> determine if a card is being played
	print(gameTimer.time_left)
	print(gameTimer.is_stopped())
	print(delta)
