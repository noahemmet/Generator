import Common

public enum CorpusError: Error {
	case invalid(String)
}

public struct Corpus {
	public var traits: Set<Trait>

	public init(traits: Set<Trait>) {
		self.traits = traits
	}
	
	public func validate() throws {
		// Validate that referenced categories in traits match the corpus' categories.
//		let traitCategories = traits.flatMap { $0.categories }
//		let corpusCategoryNames = categories.map { $0.name }
//		guard corpusCategoryNames.containsAll(traitCategories) else {
//			throw CorpusError.invalid("categories referenced in traits are not in corpus categories")
//		}
	}
	
	public func filter(with constraint: Constraint) throws -> Set<String> {
		
		// Filter traits by tag
		let filteredTraitsByTag: Set<Trait> = traits.filter { trait in
			trait.tags.map { $0.name }.containsAll(constraint.tags)
		}
		// Filter by wordKind
		let filteredWords = filteredTraitsByTag.flatMap { $0.words.filter { $0.kind == constraint.wordKind }}
		let texts = filteredWords.map { $0.text }
		return Set(texts)
	}
}
