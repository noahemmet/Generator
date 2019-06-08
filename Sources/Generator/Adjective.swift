public enum Adjective: Hashable {
	case attributive(String)
	case pastParticipal(String)
	case presentParticipal(String)
	
	public var text: String {
		switch self {
		case .attributive(let text): return text
		case .pastParticipal(let text): return text
		case .presentParticipal(let text): return text
		}
	}
}

extension Adjective: ExpressibleByStringLiteral {
	public init(_ string: String) {
		if string.hasSuffix("ed") {
			self = .pastParticipal(string)
		} else if string.hasSuffix("ing") {
			self = .presentParticipal(string)
		} else {
			self = .attributive(string)
		}
	}
	
	public init(stringLiteral value: String) {
		self.init(value)
	}
}
