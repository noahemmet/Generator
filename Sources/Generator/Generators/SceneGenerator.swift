import Common

public struct SceneGenerator {
	public let grammars: [Grammar]
	public let entities: [GeneratedEntity]
	
	/// Eventually prose
	func generateIntro(unique: Bool = false) throws -> String {
		var paragraphGenerator = ParagraphGenerator(grammars: grammars, entities: entities)
//		let grammars: [Grammar] = entities.map { "There is a \(e: $0.name)." }
//		let entityX2Grammar: Grammar = "The \(e: 0) sits in the corner, next to the \(e: "1")."
		let sentences = try entities.map { _ in try paragraphGenerator.generate(unique: unique) }
		return sentences.joined(separator: " ")
	}
}
