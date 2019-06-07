public struct Constraint {
	public var word: Word.Kind
	public var category: String?
	public var tags: [String]

	public init(word: Word.Kind, category: String? = nil, tags: [String] = []) {
		self.word = word
		self.category = category
		self.tags = tags
	}
}
