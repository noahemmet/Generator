import Common

public struct Filter {
	public var corpus: Corpus
	public private(set) var history: Set<String> = []
	public var excluded: Set<String>
	
	public init(corpus: Corpus, excluded: Set<String> = []) {
		self.corpus = corpus
		self.excluded = excluded
	}
	
	public mutating func filter(with constraint: Constraint, unique: Bool = false) throws -> String {
		let filtered = try corpus.filter(with: constraint)
		var candidates = filtered.subtracting(excluded)
		if unique {
			candidates.subtract(history)
		}
		let selected = try candidates.randomElement().unwrap(orThrow: "No candidates")
		history.insert(selected)
		return selected
	}
}
