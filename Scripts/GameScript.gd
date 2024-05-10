extends Node
class_name GameScript

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
	playerDeck = Deck.new(DefaultDecks.d1CardArray)
	oponentDeck = Deck.new(DefaultDecks.d2CardArray)
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

func _enter_tree():
	$Foreground.oponentCards = oponentHand
	print_rich("[color=red][b]oponentCards array[/b] -> "+str($Foreground.oponentCards)+"[/color]")	
	$Foreground.playerCards = playerHand
	print_rich("[color=green][b]playerCards array[/b] -> "+str($Foreground.playerCards)+"[/color]")
