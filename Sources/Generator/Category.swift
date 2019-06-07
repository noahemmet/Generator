public struct Category: ExpressibleByStringLiteral {
	public var name: String
	
	public init(stringLiteral value: String) {
		name = value
	}
}
