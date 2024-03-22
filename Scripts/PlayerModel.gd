extends Node
class_name Player

enum playerPositions { GK, CB, LB, RB, CM, CAM, CDM, LM, RM, ST, LW, RW }

var playerName: String
var playerPosition: playerPositions
# var skills: Array
# var willPower: float
# var energy: float

#func setPlayerName(name: String):
	#playerName = name
#
#func setPlayerPosition(newPos: playerPositions):
	#playerPosition = newPos

static func CreatePlayer(playerNameN: String, playerPos: playerPositions):
	var newPlayer = Player.new()
	newPlayer.playerName = playerNameN
	newPlayer.playerPosition = playerPos
	return newPlayer
