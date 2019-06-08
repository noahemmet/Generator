public struct Noun: Hashable {
	public var text: String
	public var isProper: Bool

	public init(_ text: String, isProper: Bool = false) {
		self.text = text
		self.isProper = isProper
	}
}

extension Noun: ExpressibleByStringLiteral {
	
	public init(_ string: String) {
		if string.first?.isUppercase == true {
			self.init(string, isProper: true)
		} else {
			self.init(string)
		}
	}
	
	public init(stringLiteral value: String) {
		self.init(value)
	}
}
