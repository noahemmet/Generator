public struct Trait: Hashable {
	public var words: Set<Word>
	public var tags: Set<Tag>

	public init(words: Set<Word>, tags: Tag...) {
		self.words = words
		self.tags = Set(tags)
	}
	
	public init(nouns: Set<String> = [], adjectives: Set<String> = [], tags: Set<Tag>) {
		let nounWords: [Word] = nouns.map { .n($0) }
		let adjectiveWords: [Word] = adjectives.map { .adj($0) }
		self.words = Set(nounWords + adjectiveWords)
		self.tags = tags
	}
}

extension Trait: ExpressibleByStringLiteral {
	public init(stringLiteral value: String) {
		
		let separator: Character = ","
		let nounPrefix = "n:"
		let adjectivePrefix = "adj:"
		let tagPrefix = "#"
		
		let segments = value.split(separator: separator)
		let trimmed = segments.map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
		let nouns = trimmed.filter { $0.hasPrefix(nounPrefix) }.map { $0.droppingPrefix(nounPrefix) }
		let adjectives = trimmed.filter { $0.hasPrefix(adjectivePrefix) }.map { $0.droppingPrefix(adjectivePrefix) }
		let tags = trimmed.filter { $0.hasPrefix(tagPrefix) }.map { Tag($0) }
		self.init(nouns: Set(nouns), adjectives: Set(adjectives), tags: Set(tags))
	}
}

extension Collection where Element == Trait {
	public func add(tags newTags: Tag...) -> Set<Trait> {
		let new: [Trait] = self.map { trait in
			var newTrait = trait
			newTrait.tags.formUnion(newTags)
			return newTrait
		}
		return Set(new)
	}
}
