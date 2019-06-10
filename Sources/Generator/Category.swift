import Common

public struct Category: Hashable {
	public var name: String
	public var traits: Set<Trait>
	
	public init(_ name: String, traits: Set<Trait>) {
		self.name = name
		self.traits = traits
	}
}
