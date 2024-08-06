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
const OPONENT_CARD_ROTATION_IN_RAD = {
	0: (15*PI)/180,
	1: (5*PI)/180,
	2: 0,
	3: -((5*PI)/180),
	4: -((15*PI)/180)
}

@export var oponentCards: Array
@export var playerCards: Array

func setCardRotation(cardInstance, i: int, oponent := false):
	if (oponent):
		if (i == 0):
			cardInstance.position.y -= 25
		if (i == 1):
			cardInstance.position.y -= 5
		if (i == 3):
			cardInstance.position.y -= 5
		if (i == 4):
			cardInstance.position.y -= 25
	else:
		if (i == 0):
			cardInstance.position.y += 25
		if (i == 1):
			cardInstance.position.y += 5
		if (i == 3):
			cardInstance.position.y += 5
		if (i == 4):
			cardInstance.position.y += 25

func addHandIntoScene(cards: Array, oponent := false):
	for i in range(cards.size()):
		var card : Card = cards[i]
		var cardPositionXAxis := ((DisplayServer.window_get_size().x - HORIZONTAL_PADDING_PX)/cards.size()) * i
		var newInstance := Card.new_card(card)
		# have to remove two and a half times the card_width
		newInstance.position.x = cardPositionXAxis - (2.5 * (CARD_WIDTH_PX/2))
		var yAxisConstant = DisplayServer.window_get_size().y/3
		newInstance.position.y = yAxisConstant*(-1) if (oponent) else yAxisConstant
		setCardRotation(newInstance, i, oponent)
		var spriteNode := newInstance.get_node("Sprite2D");
		var areaNode := newInstance.get_node("Area2D");
		var collisionShapeNode := newInstance.get_node("Area2D").get_node("CollisionShape2D");

		spriteNode.rotation = OPONENT_CARD_ROTATION_IN_RAD.get(i) if (oponent) else CARD_ROTATION_IN_RAD.get(i);
		areaNode.rotation = OPONENT_CARD_ROTATION_IN_RAD.get(i) if (oponent) else CARD_ROTATION_IN_RAD.get(i);
		collisionShapeNode.rotation = OPONENT_CARD_ROTATION_IN_RAD.get(i) if (oponent) else CARD_ROTATION_IN_RAD.get(i);
		add_child(newInstance)

func _ready():
		## Layout width is designed as:
	## | ----------- total: 960px -------------- |
	## |blank|card1|card2|card3|card4|card5|blank|
	## |125px|142px|142px|142px|142px|142px|125px|
	## (1) Calculate X axis position dynamically
	## have to remove two and a half times the card_width

	## (2) Calculate Y axis position dynamically
	## Layout height composed as three sections:
	##  - Bottom: player hand
	##  - Center: Field (context)(graphical feedback)
	##  - Top: opponent (context)(graphical feedback)
	## |-----------------------------------------|
	## ||||||||||||||||||-120px|||||||||||||||||||
	## |-----------------------------------------|
	## |||||||||||||||||||0px|||||||||||||||||||||
	## |-----------------------------------------|
	## |||||||||||||||||||120px|||||||||||||||||||
	## |-----------------------------------------|
	## Divide that in two to get the center of the section; simplify and get:
	## (3) calculate card rotation relative to the center of the window
	addHandIntoScene(playerCards)
	addHandIntoScene(oponentCards, true)

func _process(delta):
	print(delta)
	var card_nodes := get_node("Card")

func _onMainScreenButtonPressed():
	get_tree().change_scene_to_file("res://Main.tscn")

func _onExitButtonPressed():
	get_tree().quit()
