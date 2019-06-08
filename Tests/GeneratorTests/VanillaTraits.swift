import Common
import Generator

public let animalTraits: Set<Trait> = [
	"n:feather, adj:feathered, adj:feathery, #body part, #bird, #lightweight, #flying, #sky",
	
	"n:horn, adj:horned, adj:horney, #body part, #spikey, #defensive",
	
	
	"adj:slippery, #fish",
	
	Trait(words: [.n("fish"), .adj("fishy"), .adj("scaly")],
		  tags: "fishy", "swims", "scaly", "slippery"),
	
	Trait(adjectives: ["blue", "orange"],
		  tags: ["color"]),
]

public let instruments: Set<Trait> = [
	"n:horn, #loud",
	]
	.add(tags: "#instrument")
