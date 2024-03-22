extends Node
class_name PitchArea

enum PitchAreaStatusTypes { DRY, WET }

var players: Array
var chaosPercentage: float
var ballLoosePercentage: float
var goalChance: float
var status: PitchAreaStatusTypes

func _init():
	players = []
	chaosPercentage = 0.0
	ballLoosePercentage = 0.0
	goalChance = 0.0
	status = PitchAreaStatusTypes.DRY #todo: dynamically inherit from the Pitch object, which has a weather attribute

func addPlayer(player: Player):
	pass

func removePlayer(playerToRemove: Player):
	pass

func setChaosPercentage(newPercentage: float):
	pass

func setBallLoosePercentage(newPercentage: float):
	pass

func setGoalChance(newPercentage: float):
	pass

func setStatus(newStatus: PitchAreaStatusTypes):
	pass
