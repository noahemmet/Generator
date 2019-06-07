public struct Trait: Hashable {
	public var categories: [String]
	public var words: [Word]
	public var tags: [Tag]

	public init(categories: [String], words: [Word], tags: Tag...) {
		self.categories = categories
		self.words = words
		self.tags = tags
	}
	
	public init(categories: [String], nouns: [String] = [], adjectives: [String] = [], tags: [Tag]) {
		self.categories = categories
		let nounWords: [Word] = nouns.map { .noun($0) }
		let adjectiveWords: [Word] = adjectives.map { .adjective($0) }
		self.words = nounWords + adjectiveWords
		self.tags = tags
	}
}
