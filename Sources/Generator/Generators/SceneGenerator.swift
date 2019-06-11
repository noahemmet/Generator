import Common

public struct SceneGenerator {
	public let areaGrammars: [Grammar]
	public let entityGrammars: [Grammar]
	public let areas: [GeneratedEntity]
	public let entities: [GeneratedEntity]
//	private var areaGrammarHistory: [Grammar] = []
//	private var entityGrammarHistory: [Grammar] = []
	
	public func generate(unique: Bool = false) throws -> (area: String, entities: String) {
		let area = try generateAreaProse(unique: unique)
		let entityProse = try generateEntryProse(unique: unique)
		return (area, entityProse)
	}
	
	/// Eventually prose
	private func generateAreaProse(unique: Bool = false) throws -> String {
		var paragraphGenerator = ParagraphGenerator(grammars: areaGrammars, entities: areas)
		return try paragraphGenerator.generate(unique: unique)
	}
	
	private func generateEntryProse(unique: Bool = false) throws -> String {
		var paragraphGenerator = ParagraphGenerator(grammars: entityGrammars, entities: entities)
		//		let grammars: [Grammar] = entities.map { "There is a \(e: $0.name)." }
		//		let entityX2Grammar: Grammar = "The \(e: 0) sits in the corner, next to the \(e: "1")."
		let sentences = try entities.map { _ in try paragraphGenerator.generate(unique: unique) }
		return sentences.joined(separator: " ")
	}
}
