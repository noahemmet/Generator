import Common

public struct SceneGenerator {
	public let corpus: Corpus
	public let entities: [GeneratedEntity]
	
	/// Eventually prose
	func generateIntro() throws -> String {
		let paragraphGenerator = ParagraphGenerator(entities: entities)
		let grammars: [Grammar] = entities.map { "There is a \(e: $0.name)." }
		let entityX2Grammar: Grammar = "The \(e: 0) sits in the corner, next to the \(e: "1")."
		let sentences = try grammars.map { try paragraphGenerator.generate(on: $0) }
		return sentences.joined(separator: " ")
	}
}
