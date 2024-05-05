extends Node
class_name Foreground

const CARD_INSTANCE_SCENE_REF = preload("res://Gameplay/Scenes/MainGameLoop/Game/Cards/Card.tscn")

@export var oponentCards: Array
@export var oponentCardsXAxisAlign: float = 0.0 #todo: dynamically calculate based on resolution
@export var playerCards: Array
@export var playerCardsXAxisAlign: float = 0.0 #todo: dynamically calculate based on resolution

func _process(delta):
	for card: Card in oponentCards:
		#var cardInstance = CARD_INSTANCE_SCENE_REF.instantiate()
		#add_child(cardInstance)
		print(card)
	
	for card: Card in playerCards:
		print(card)

func _onMainScreenButtonPressed():
	get_tree().change_scene_to_file("res://Main.tscn")

func _onExitButtonPressed():
	get_tree().quit()
