public struct Constraint {
	public var wordKind: Word.Kind
	public var tags: [String]

	public init(_ wordKind: Word.Kind, _ tags: String...) {
		self.wordKind = wordKind
		self.tags = tags
	}
}
