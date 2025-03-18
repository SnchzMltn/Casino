# CASINO

## What?

2D multi-player deck-builder Game

## How?

### Screen

	> Layout width is designed as:
	> | ----------- total: 960px -------------- |
	> |blank|card1|card2|card3|card4|card5|blank|
	> |125px|142px|142px|142px|142px|142px|125px|
	> (1) Calculate X axis position dynamically
	> have to remove two and a half times the card_width

	> (2) Calculate Y axis position dynamically
	> Layout height composed as three sections:
	>  - Bottom: player hand
	>  - Center: Field (context)(graphical feedback)
	>  - Top: opponent (context)(graphical feedback)
	> |-----------------------------------------|
	> ||||||||||||||||||-120px|||||||||||||||||||
	> |-----------------------------------------|
	> |||||||||||||||||||0px|||||||||||||||||||||
	> |-----------------------------------------|
	> |||||||||||||||||||120px|||||||||||||||||||
	> |-----------------------------------------|
	> Divide that in two to get the center of the section; simplify and get:
	> (3) calculate card rotation relative to the center of the window

### Architecture:

The idea is to have two clients connected via websockets to be able to share the same Pitch

[Godot client] -> websocket -> [Godot client]

## Dependencies?
