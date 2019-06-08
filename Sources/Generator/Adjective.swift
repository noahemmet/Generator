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
	
	public var kind: Kind {
		switch self {
		case .attributive: return .attributive
		case .pastParticipal: return .pastParticipal
		case .presentParticipal: return .presentParticipal
		}
	}
}

extension Adjective {
	public enum Kind: Hashable {
//		case any
		case attributive
		case pastParticipal
		case presentParticipal
		
//		public var isAny: Bool {
//			if case .any = self {
//				return true
//			}
//			return false
//		}
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
