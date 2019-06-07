public struct Generator {
	public var corpus: Corpus

	public init(corpus: Corpus) {
		self.corpus = corpus
	}
	
	public func generate(with constraint: Constraint) throws {
		let filtered = try corpus.filter(with: constraint)
	}
}
