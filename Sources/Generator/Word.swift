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
		case .adjective: return .adjective
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
	public enum Kind {
		case noun
		case adjective
	}
}
