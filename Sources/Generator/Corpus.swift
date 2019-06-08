import Common

public enum CorpusError: Error {
	case invalid(String)
}

public struct Corpus {
	public var categories: Set<Category>
	public var traits: Set<Trait>

	public init(categories: Set<Category>, traits: Set<Trait>) {
		self.categories = categories
		self.traits = traits
	}
	
	public func validate() throws {
		// Validate that referenced categories in traits match the corpus' categories.
		let traitCategories = traits.flatMap { $0.categories }
		let corpusCategoryNames = categories.map { $0.name }
		guard corpusCategoryNames.containsAll(traitCategories) else {
			throw CorpusError.invalid("categories referenced in traits are not in corpus categories")
		}
	}
	
	public func filter(with constraint: Constraint) throws -> Set<String> {
		// Filter by category
		let filteredCategories: Set<Category>
		if let categoryName = constraint.category {
			filteredCategories = categories.filter { $0.name == categoryName }
		} else {
			filteredCategories = categories
		}
		
		// Filter traits by category
		let filteredTraitsByCategory: Set<Trait>
		if !filteredCategories.isEmpty {
			filteredTraitsByCategory = traits.filter { trait in
				trait.categories.contains(constraint.category)
			}
		} else {
			filteredTraitsByCategory = traits
		}
		
		// Filter traits by tag
		let filteredTraitsByTag: Set<Trait> = filteredTraitsByCategory.filter { trait in
			trait.tags.map { $0.name }.containsAll(constraint.tags)
		}
		// Filter by wordKind
		let filteredWords = filteredTraitsByTag.flatMap { $0.words.filter { $0.kind == constraint.word }}
		let texts = filteredWords.map { $0.text }
		return Set(texts)
	}
}
