extends Node
class_name DefaultDecks

static var d1CardArray: Array = [
	Card.new("card1", Card.CardTypeEnum.OFFENSIVE, CardEffect.new({})),
	Card.new("card2", Card.CardTypeEnum.DEFENSIVE, CardEffect.new({})),
	Card.new("card3", Card.CardTypeEnum.OFFENSIVE, CardEffect.new({})),
	Card.new("card4", Card.CardTypeEnum.DEFENSIVE, CardEffect.new({})),
	Card.new("card5", Card.CardTypeEnum.OFFENSIVE, CardEffect.new({})),
]

static var d2CardArray: Array = [
	Card.new("card1", Card.CardTypeEnum.OFFENSIVE, CardEffect.new({})),
	Card.new("card2", Card.CardTypeEnum.DEFENSIVE, CardEffect.new({})),
	Card.new("card3", Card.CardTypeEnum.OFFENSIVE, CardEffect.new({})),
	Card.new("card4", Card.CardTypeEnum.DEFENSIVE, CardEffect.new({})),
	Card.new("card5", Card.CardTypeEnum.OFFENSIVE, CardEffect.new({})),
]

static func _get_random_card_array() -> Array:
	var i: int = randi_range(0, 1)
	match i:
		0: return d1CardArray
		1: return d2CardArray
	return []
