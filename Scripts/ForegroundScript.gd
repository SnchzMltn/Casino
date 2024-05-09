extends Node
class_name Foreground

@export var oponentCards: Array
@export var oponentCardsXAxisAlign: float = 0.0 #todo: dynamically calculate based on resolution
@export var playerCards: Array
@export var playerCardsXAxisAlign: float = 0.0 #todo: dynamically calculate based on resolution

func _process(_delta):
	for card: Card in oponentCards:
		var newInstance := Card.new_card(card)
		print_rich("[color=blue][b]Upstream cardname[/b] -> "+str(card.cardName)+"[/color]")
		#todo: I have access to the node, it's correct, I'm expecting to be able to access
		# member attributes of the objet with reference Card:<Node2D#36087792847>
		print_rich("[color=green][b]Current instance card node[/b] -> "+str(newInstance)+"[/color]")
		add_child(newInstance)
	# todo: do the same for the player hand

func _onMainScreenButtonPressed():
	get_tree().change_scene_to_file("res://Main.tscn")

func _onExitButtonPressed():
	get_tree().quit()
