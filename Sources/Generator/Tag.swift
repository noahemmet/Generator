public struct Tag: Hashable, ExpressibleByStringLiteral {
	public static let defaultWeight: Weight = 0
	public let name: String
	public let weight: Weight
	
	public init(stringLiteral value: String) {
		let positiveStrings = value.split(separator: "+")
		let negativeStrings = value.split(separator: "-")
		if positiveStrings.count == 2 {
			self.name = String(positiveStrings[0])
			self.weight = Int(positiveStrings[1])!
		} else if negativeStrings.count == 2 {
			self.name = String(negativeStrings[0])
			self.weight = -Int(negativeStrings[1])!
		} else {
			self.name = value
			self.weight = Tag.defaultWeight
		}
	}
}
