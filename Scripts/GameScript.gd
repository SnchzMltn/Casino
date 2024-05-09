extends Node
class_name GameScript

@onready var backgroundNode: Node2D = get_node("Background")
@onready var foregroundNode: Node2D = get_node("Foreground")

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

func _serveCardsToPlayers(deck: Deck):
	return deck.cards.slice(0, 5)

#todo: implement
#func _takeTurn(cardPlayed: Card):
	#pass

func _process(delta):
	foregroundNode.oponentCards = oponentHand
	print_rich("[color=red][b]Delta value[/b] -> "+str(foregroundNode.oponentCards)+"[/color]")	
	foregroundNode.playerCards = playerHand
	print_rich("[color=red][b]Delta value[/b] -> "+str(foregroundNode.playerCards)+"[/color]")
	print_rich("[color=magenta][b]Delta value[/b] -> "+str(delta)+"[/color]")
