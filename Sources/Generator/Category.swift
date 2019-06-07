public struct Category: Hashable, ExpressibleByStringLiteral {
	public var name: String
	
	public init(stringLiteral value: String) {
		name = value
	}
}
