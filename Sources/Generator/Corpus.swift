import Common

public enum CorpusError: Error {
	case invalid(String)
}

public struct Corpus {
	public var categories: Set<Category>
	public var traits: Set<Trait>

	public init(categories: Set<Category>) {
		self.categories = categories
		self.traits = Set(categories.flatMap { $0.traits })
	}
	
	public func validate() throws {
		// Validate that referenced categories in traits match the corpus' categories.
//		let traitCategories = traits.flatMap { $0.categories }
//		let corpusCategoryNames = categories.map { $0.name }
//		guard corpusCategoryNames.containsAll(traitCategories) else {
//			throw CorpusError.invalid("categories referenced in traits are not in corpus categories")
//		}
	}
	
	
	public var allTags: [String] {
		let tags = traits.flatMap { $0.tags }.map { $0.name }
		let sorted = tags.sorted(by: <)
		return sorted
	}
	
	public var tagsByFrequency: [(Int, String)] {
		let tags = traits.flatMap { $0.tags }.map { $0.name }
		var tagCountsByName: [String: Int] = [:]
		for tag in tags {
			tagCountsByName[tag, default: 0] += 1
		}
		let tagsByFrequency: [(Int, String)] = tagCountsByName.map { (arg) -> (Int, String) in
			let (tag, count) = arg
			return (count, tag)
		}
		return tagsByFrequency
	}
	
	public func filter(with constraint: Constraint) throws -> Set<String> {
		
		// Filter traits by tag
		let filteredTraitsByTag: Set<Trait> = traits.filter { trait in
			trait.tags.containsAll(constraint.tags)
		}
		// Filter by wordKind
		let filteredWords = filteredTraitsByTag.flatMap { $0.words.filter { $0.kind == constraint.wordKind }}
		let texts = filteredWords.map { $0.text }
		return Set(texts)
	}
}
