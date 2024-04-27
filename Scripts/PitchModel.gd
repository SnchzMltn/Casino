extends Node
class_name Pitch

enum weatherTypes { SUNNY, RAIN, STORM, CLOUDY }

@onready var stadiumName: String
@onready var weather: weatherTypes
@onready var pitchAreas: Dictionary

@onready var playerTeam: Array # Player[]
#@onready var playerFormation: PlayerFormation

@onready var opponentTeam: Array # Player[]
#@onready var playerFormation: PlayerFormation


func _init():
	stadiumName = "New Stadium"
	weather = weatherTypes.SUNNY
	pitchAreas = {
		"A1": PitchArea.new(),
		"A2": PitchArea.new(),
		"A3": PitchArea.new(),
		"A4": PitchArea.new(),
		"A5": PitchArea.new(),
		"A6": PitchArea.new(),
		"B1": PitchArea.new(),
		"B2": PitchArea.new(),
		"B3": PitchArea.new(),
		"B4": PitchArea.new(),
		"B5": PitchArea.new(),
		"B6": PitchArea.new(),
		"C1": PitchArea.new(),
		"C2": PitchArea.new(),
		"C3": PitchArea.new(),
		"C4": PitchArea.new(),
		"C5": PitchArea.new(),
		"C6": PitchArea.new(),
	}
	playerTeam.fill(Player.CreatePlayer("J. Doe", Player.playerPositions.GK))
	opponentTeam.fill(Player.CreatePlayer("J. Doe", Player.playerPositions.GK))

func setStadiumName(newName: String):
	stadiumName = newName

func setWeather(newWeather: weatherTypes):
	weather = newWeather

func setPitchArea(mappingKey: String, newPitchArea: PitchArea):
	pitchAreas[mappingKey] = newPitchArea
