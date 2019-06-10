import Common
import Generator

public enum Vanilla { }

extension Vanilla {
	public static let fauna = Category("fauna", traits: [
		"n:feather, adj:feathered, adj:feathery, #bird, #body part, #lightweight, #flying, #sky",
		
		"adj:horned, adj:horney, #body part, #spikey, #defensive",
		
		"n:fish, n:trout, n:salmon, n:tuna, adj:fishy, adj:scaly, #sea creature, #ocean, #slippery, #entity",
		])
	
	public static let flora = Category("flora", traits: [
		"n:vine, adj:viney, adj:vined, #plant",
		
		"adj:horned, adj:horney, #body part, #spikey, #defensive",
		
		"n:fish, n:trout, n:salmon, n:tuna, adj:fishy, adj:scaly, #sea creature, #ocean, #slippery",
		])
}
