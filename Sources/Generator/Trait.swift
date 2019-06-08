public struct Trait: Hashable {
	public var words: [Word]
	public var categories: [String]
	public var tags: [Tag]

	public init(words: [Word], categories: [String], tags: Tag...) {
		self.words = words
		self.categories = categories
		self.tags = tags
	}
	
	public init(nouns: [String] = [], adjectives: [String] = [], categories: [String], tags: [Tag]) {
		let nounWords: [Word] = nouns.map { .noun($0) }
		let adjectiveWords: [Word] = adjectives.map { .adjective($0) }
		self.words = nounWords + adjectiveWords
		self.categories = categories
		self.tags = tags
	}
}
