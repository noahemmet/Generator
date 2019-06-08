public struct Generator {
	public var corpus: Corpus
	public private(set) var history: Set<String> = []
	public var excluded: Set<String>
	public init(corpus: Corpus, excluded: Set<String> = []) {
		self.corpus = corpus
		self.excluded = excluded
	}
	
	public func generate(with constraint: Constraint) throws -> String {
		let filtered = try corpus.filter(with: constraint)
		let removeExcluded = filtered.subtracting(excluded)
		let generated = try removeExcluded.randomElement().unwrap()
		return generated
	}
}
