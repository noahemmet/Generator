import Common

public struct ParagraphGenerator {
	public var grammars: [Grammar]
	public let entities: [GeneratedEntity]
	
	// Eventually -> Prose
	public mutating func generate(unique: Bool = false) throws -> String {
		let grammar = try grammars.dropRandom().unwrap()
		let sentences: [String] = try grammar.segments.map { segment in
			switch segment {
			case .entity(let entityKey):
				let entity = try self.entity(for: entityKey)
				return entity.name
			case .text(let text):
				return text
			case .constraint:
				fatalError()
			}
		}
		return sentences.reduce("") { $0 + $1 }
	}
	
	private func entity(for key: String) throws -> GeneratedEntity {
		if let numbered = Int(key) {
			let entity = entities.element(at: numbered)
			return try entity.unwrap(orThrow: "No entity found at index: \(numbered)")
		} else {
			let entity = entities.first { $0.name == key }
			return try entity.unwrap(orThrow: "No entity found with key: \(key)")
		}
	}
}
