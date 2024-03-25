extends Node

@onready var PlayBotButton := get_node("PlayBotButton")
@onready var PlayHumanButton := get_node("PlayHumanButton")
@onready var ManageDeckButton := get_node("ManageDeckButton")
@onready var BackButton := get_node("BackButton")

func _onBackButtonPressed():
	get_tree().change_scene_to_file("res://Main.tscn")

func _onPlayBotButtonPressed():
	get_tree().change_scene_to_file("res://Gameplay/Scenes/MainGameLoop/Game/Game.tscn")

func _ready():
	PlayBotButton.pressed.connect(self._onPlayBotButtonPressed)
	BackButton.pressed.connect(self._onBackButtonPressed)
