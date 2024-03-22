extends Node

@onready var MainNode = get_node("/root/Main")

enum gameStates { MAIN_SCREEN, PLAYING, SCORE_SCREEN }

var currGameState = gameStates.MAIN_SCREEN

func getGameState():
	return currGameState

func updateGameState(newState: gameStates):
	if newState is gameStates:
		currGameState = newState
	else:
		push_error("Invalid game state")

func _on_button_pressed():
	hideMenu()
	#todo: start new game

func showMenu():
	$NewGameButton.show()
	$OptionsButton.show()
	$ExitButton.show()

func hideMenu():
	$NewGameButton.hide()
	$OptionsButton.hide()
	$ExitButton.hide()

func _ready():
	var newGameButton = get_node("NewGameButton")
	var optionsButton = get_node("OptionsButton")
	var exitButton = get_node("ExitButton")
