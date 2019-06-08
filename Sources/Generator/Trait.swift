public struct Trait: Hashable {
	public var words: [Word]
	public var tags: [Tag]

	public init(words: [Word], tags: Tag...) {
		self.words = words
		self.tags = tags
	}
	
	public init(nouns: [String] = [], adjectives: [String] = [], tags: [Tag]) {
		let nounWords: [Word] = nouns.map { .n($0) }
		let adjectiveWords: [Word] = adjectives.map { .adj($0) }
		self.words = nounWords + adjectiveWords
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
		self.init(nouns: nouns, adjectives: adjectives, tags: tags)
	}
}
