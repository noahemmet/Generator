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
