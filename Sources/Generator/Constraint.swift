public struct Constraint {
	public var word: Word.Kind
	public var tags: [String]

	public init(word: Word.Kind, tags: String...) {
		self.word = word
		self.tags = tags
	}
}
