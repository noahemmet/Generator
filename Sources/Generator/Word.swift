public enum Word: Hashable {
	case noun(String)
	case adjective(Adjective)
	
	public static func n(_ noun: String) -> Word {
		return .noun(noun)
	}
	
	public static func adj(_ adjective: Adjective) -> Word {
		return .adjective(adjective)
	}
	
	public var kind: Kind {
		switch self {
		case .adjective: return .adjective
		case .noun: return .noun
		}
	}
	
	public var text: String {
		switch self {
		case .adjective(let adjective): return adjective.text
		case .noun(let noun): return noun
		}
	}
}

extension Word {
	public enum Kind {
		case noun
		case adjective
	}
}
