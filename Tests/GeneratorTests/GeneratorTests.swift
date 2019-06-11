import XCTest
@testable import Generator

final class GeneratorTests: XCTestCase {
	
	public let corpus = Corpus(
		categories: [
			Vanilla.fauna, Vanilla.flora
			]
	)
	
	func testCorpus() throws {
		try corpus.validate()
	}
	
	func testGenerator() throws {
		var filter = Filter(corpus: corpus)
		let constraint: Constraint = "adj: #body part"
		let strings = try filter.filter(with: constraint)
		print(strings)
		print(filter.corpus.tagsByFrequency)
		XCTAssertFalse(strings.isEmpty)
	}
	
	
	func testSceneGenerator() throws {
		var filter = Filter(corpus: corpus)
		let constraint: Constraint = "n: #entity"
		let strings = try! filter.filter(with: constraint)
		print(strings)
		XCTAssertFalse(strings.isEmpty)
	}
	
	
	func testEntityGenerator() throws {
		struct MyEntity: GeneratedEntity {
			var name: String
			var tags: [Tag]
		}
		
		struct MyArea: GeneratedEntity {
			var name: String
			var tags: [Tag]
		}
		
		let entityGenerator = EntityGenerator<MyEntity>(corpus: corpus)
		let entityGrammar: Grammar = "\(adj: "#body part")) \(n: "#sea creature")"
		let entity1 = try entityGenerator.generate(with: entityGrammar) { (name, tags) -> MyEntity in
			return .init(name: name, tags: tags)
		}
		let entity2 = try entityGenerator.generate(with: entityGrammar) { (name, tags) -> MyEntity in
			return .init(name: name, tags: tags)
		}
		let entities = [entity1, entity2]
		
		let areaGrammars: [Grammar] = [
			"You enter the \(e: 0). It is very \(e: "0", c: .init(.adjective(.presentParticipal)))",
			"You step into the \(e: 0)."
		]
		
		let entityGrammars: [Grammar] = [
			"There is a \(e: 0).",
			"You see a \(e: 0).",
			"A \(e: 0) is visible.",
			"The \(e: 0) sits in the corner, next to the \(e: "1")."
		]
		
		let areas: [GeneratedEntity] = [
			MyArea(name: "cave", tags: ["damp"]),
			MyArea(name: "beach", tags: ["sunny"]),
		] 
		
		let sceneGenerator = SceneGenerator(areaGrammars: areaGrammars, entityGrammars: entityGrammars, areas: areas, entities: entities)
		let scene = try sceneGenerator.generate()
		print(scene)
		print("")
	}
	
	
	static var allTests = [
		("testGenerator", testGenerator),
	]
}
