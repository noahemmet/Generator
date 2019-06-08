public struct Tag: Hashable, ExpressibleByStringLiteral {
	public static let defaultWeight: Weight = 0
	public let name: String
	public let weight: Weight
	
	public init(_ string: String) {
		let string = string.droppingPrefix("#")
		let positiveStrings = string.split(separator: "+")
		let negativeStrings = string.split(separator: "-")
		if positiveStrings.count == 2 {
			self.name = String(positiveStrings[0])
			self.weight = Int(positiveStrings[1])!
		} else if negativeStrings.count == 2 {
			self.name = String(negativeStrings[0])
			self.weight = -Int(negativeStrings[1])!
		} else {
			self.name = string
			self.weight = Tag.defaultWeight
		}
	}
	
	public init(stringLiteral value: String) {
		self.init(value)
	}
}

//extension Array: ExpressibleByStringLiteral where Element: ExpressibleByStringLiteral {
//	public init(stringLiteral value: String) {
//		fatalError()
//	}
//}
