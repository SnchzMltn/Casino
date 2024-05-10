extends Node
class_name Foreground

@export var oponentCards: Array
@export var oponentCardsXAxisAlign: float = 0.0 #todo: dynamically calculate based on resolution
@export var playerCards: Array
@export var playerCardsXAxisAlign: float = 0.0 #todo: dynamically calculate based on resolution

func _ready():
	for i in range(oponentCards.size()):
		var card : Card = oponentCards[i]
		# Layout is designed as:
		# | ----------- total: 960px -------------- |
		# |blank|card1|card2|card3|card4|card5|blank|
		# |125px|142px|142px|142px|142px|142px|125px|
		
		# (1) Calculate X axis position dynamically
		var cardPositionXAxis := ((DisplayServer.window_get_size().x - 250)/oponentCards.size()) * i
		print_rich("[color=purple][b]New Card pos[/b] ---> "+str(cardPositionXAxis)+"[/color]")
		var newInstance := Card.new_card(card)
		# have to remove two and a half times the card_width
		# todo: move these to constants
		newInstance.position.x = cardPositionXAxis - (142 * 2.5)
		# (2) todo: calculate Y axis position dynamically
		add_child(newInstance)
	# todo: do the same for the player hand

func _onMainScreenButtonPressed():
	get_tree().change_scene_to_file("res://Main.tscn")

func _onExitButtonPressed():
	get_tree().quit()
