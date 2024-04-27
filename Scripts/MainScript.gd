extends Node

@onready var MainNode := get_node("/root/Main")
@onready var NewGameButton := get_node("NewGameButton")
@onready var OptionsButton := get_node("OptionsButton")
@onready var ExitButton := get_node("ExitButton")

enum gameStates { MAIN_SCREEN, PLAYING, SCORE_SCREEN }

@export var currGameState = gameStates.MAIN_SCREEN

func getGameState():
	return currGameState

func updateGameState(newState: gameStates):
	if newState is gameStates:
		currGameState = newState
	else:
		push_error("Invalid game state")

func showMenu():
	$NewGameButton.show()
	$OptionsButton.show()
	$ExitButton.show()

func hideMenu():
	$NewGameButton.hide()
	$OptionsButton.hide()
	$ExitButton.hide()

func _newGameButtonPressed():
	print("new game!!")
	get_tree().change_scene_to_file("res://Gameplay/Scenes/NewGame/NewGame.tscn")

func _optionsButtonPressed():
	print("Options...")
	#todo: implement a Scene for [get_tree().change_scene_to_file()]

func _exitButtonPressed():
	print("Exit")
	get_tree().quit()

func _ready():
	NewGameButton.pressed.connect(self._newGameButtonPressed)
	OptionsButton.pressed.connect(self._optionsButtonPressed)
	ExitButton.pressed.connect(self._exitButtonPressed)
