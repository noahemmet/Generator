import Common
import Generator

public let animalTraits: Set<Trait> = [
	"n:feather, adj:feathered, adj:feathery, #body part, #bird, #lightweight, #flying, #sky",
	
	"n:horn, adj:horned, adj:horney, #body part, #spikey, #defensive",
	
	"adj:slippery, #fish",
	
	"n:fish, n:trout, n:salmon, n:tuna, adj:fishy, adj:scaly, #sea creature, #scaly, #slippery",
	
	Trait(adjectives: ["blue", "orange"],
		  tags: ["color"]),
	]
	.add(tags: "#animal")

public let instruments: Set<Trait> = [
	"n:horn, #loud",
	]
	.add(tags: "#instrument")
