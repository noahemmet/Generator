public enum Word: Hashable {
	case noun(Noun)
	case adjective(Adjective)
	
	public static func n(_ noun: Noun) -> Word {
		return .noun(noun)
	}
	
	public static func n(_ noun: String) -> Word {
		return .noun(.init(noun))
	}
	
	public static func adj(_ adjective: Adjective) -> Word {
		return .adjective(adjective)
	}
	
	public static func adj(_ adjective: String) -> Word {
		return .adjective(.init(adjective))
	}
	
	public var kind: Kind {
		switch self {
		case .adjective(let adj): return .adjective(adj.kind)
		case .noun: return .noun
		}
	}
	
	public var text: String {
		switch self {
		case .adjective(let adjective): return adjective.text
		case .noun(let noun): return noun.text
		}
	}
}

extension Word {
	public enum Kind: Hashable {
		case noun
		case adjective(Adjective.Kind)
		
//		public var isAny: Bool {
//			switch self {
//			case .adjective(let adj):
//				return adj.isAny
//			case .noun:
//				return false
//			}
//		}
//		
//		public func matches(_ otherKind: Kind) -> Bool {
//			if otherKind.isAny {
//				return true
//			}
//			return otherKind == self
//		}
	}
}
