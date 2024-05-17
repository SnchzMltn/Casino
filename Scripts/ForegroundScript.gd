extends Node
class_name Foreground

const HORIZONTAL_PADDING_PX = 250
const CARD_WIDTH_PX = 280
const CARD_ROTATION_IN_RAD = {
	0: -((15*PI)/180),
	1: -((5*PI)/180),
	2: 0,
	3: (5*PI)/180,
	4: (15*PI)/180
}

@export var oponentCards: Array
@export var playerCards: Array

func _ready():
	for i in range(playerCards.size()):
		var card : Card = playerCards[i]
		# Layout width is designed as:
		# | ----------- total: 960px -------------- |
		# |blank|card1|card2|card3|card4|card5|blank|
		# |125px|142px|142px|142px|142px|142px|125px|
		# (1) Calculate X axis position dynamically
		var cardPositionXAxis := ((DisplayServer.window_get_size().x - HORIZONTAL_PADDING_PX)/oponentCards.size()) * i
		var newInstance := Card.new_card(card)
		# have to remove two and a half times the card_width
		newInstance.position.x = cardPositionXAxis - (2.5 * (CARD_WIDTH_PX/2))

		# (2) Calculate Y axis position dynamically
		# Layout height composed as three sections:
		#  - Bottom: player hand
		#  - Center: Field (context)(graphical feedback)
		#  - Top: opponent (context)(graphical feedback)
		# |-----------------------------------------|
		# |||||||||||||||||||240px|||||||||||||||||||
		# |-----------------------------------------|
		# |-----------------------------------------|
		# |||||||||||||||||||240px|||||||||||||||||||
		# |-----------------------------------------|
		# |-----------------------------------------|
		# |||||||||||||||||||240px|||||||||||||||||||
		# |-----------------------------------------|
		# Divide that in two to get the center of the section; simplify and get:
		newInstance.position.y = DisplayServer.window_get_size().y/6
		if (i == 0):
			newInstance.position.y += 25
		if (i == 1):
			newInstance.position.y += 5
		if (i == 3):
			newInstance.position.y += 5
		if (i == 4):
			newInstance.position.y += 25

		# (3) calculate card rotation relative to the center of the window
		var spriteNode := newInstance.get_node("Sprite2D");
		var areaNode := newInstance.get_node("Area2D");
		var collisionShapeNode := newInstance.get_node("Area2D").get_node("CollisionShape2D");

		spriteNode.rotation = CARD_ROTATION_IN_RAD.get(i);
		areaNode.rotation = CARD_ROTATION_IN_RAD.get(i);
		collisionShapeNode.rotation = CARD_ROTATION_IN_RAD.get(i);

		#print_rich("[color=purple][b]New Card pos[/b] ---> ("+str(newInstance.position.x) + ", " + str(newInstance.position.y) +")[/color]")
		#print_rich("[color=purple][b]New Card index[/b] ---> ("+ str(i) + " with rotation -> " + str(newInstance.rotation) +")[/color]")

		add_child(newInstance)
	# todo: extract for loop to a function and do the same for the player hand

func _process(delta):
	print(delta)
	var card_nodes := get_node("Card")
	print(card_nodes)
	#$Card.get_node("CollisionShape2D").transform.rotation = -15

func _onMainScreenButtonPressed():
	get_tree().change_scene_to_file("res://Main.tscn")

func _onExitButtonPressed():
	get_tree().quit()
