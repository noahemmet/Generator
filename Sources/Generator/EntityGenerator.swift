import Common

public struct EntityGenerator<Entity: GeneratedEntity> {
	public let corpus: Corpus

	public init(corpus: Corpus) {
		self.corpus = corpus
	}
	
	public typealias GenerationHandler = (String, [Tag]) -> Entity
	public func generate(with grammar: Grammar, handle: GenerationHandler) throws -> Entity {
		
		var filter = Filter(corpus: corpus)
		let constraints = grammar.allConstraints
		let tags = try constraints.map { try filter.filter(with: $0) }
		let name = tags.joined(separator: " ")
		let entity = handle(name, tags.map { Tag($0) })
		return entity
	}
}

public protocol GeneratedEntity {
	var name: String { get }
	var tags: [Tag] { get }
}
