import Common

public enum CorpusError: Error {
	case invalid(String)
}

public struct Corpus {
	public var categories: [Category]
	public var traits: [Trait]

	public init(categories: [Category], traits: [Trait]) {
		self.categories = categories
		self.traits = traits
	}
	
	public func validate() throws {
		let traitCategories = traits.flatMap { $0.categories }
		let corpusCategoryNames = categories.map { $0.name }
		guard corpusCategoryNames.containsAll(traitCategories) else {
			throw CorpusError.invalid("categories in constraint are not in corpus categories")
		}
	}
	
	public func filter(with constraint: Constraint) throws -> [String] {
		// Filter by category
		let filteredCategories: [Category]
		if let categoryName = constraint.category {
			filteredCategories = categories.filter { $0.name == categoryName }
		} else {
			filteredCategories = categories
		}
		
		// Filter traits by category
		let filteredTraitsByCategory: [Trait]
		if !filteredCategories.isEmpty {
			filteredTraitsByCategory = traits.filter { trait in
				trait.categories.contains(constraint.category)
			}
		} else {
			filteredTraitsByCategory = traits
		}
		
		// Filter traits by tag
		let filteredTraitsByTag: [Trait] = filteredTraitsByCategory.filter { trait in
			trait.tags.map { $0.name }.containsAll(constraint.tags)
		}
		// Filter by wordKind
		let filteredWords = filteredTraitsByTag.flatMap { $0.words.filter { $0.kind == constraint.word }}
		let texts = filteredWords.map { $0.text }
		return texts
	}
}
