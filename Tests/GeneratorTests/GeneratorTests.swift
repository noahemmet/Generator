import XCTest
@testable import Generator

final class GeneratorTests: XCTestCase {
	struct MyEntity: GeneratedEntity {
		var name: String
		var tags: [Tag]
	}
	
	struct MyArea: GeneratedEntity {
		var name: String
		var tags: [Tag]
	}
	
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
	}
	
	func testSceneTemplates() throws {
//		let e1 = MyEntity(name: "rainbow-snouted pirk", tags: ["#rainbow, #snouted, #slippery, #sea creature"])
//		let e2 = MyEntity(name: "llama bat", tags: ["#flying, #winged"])
//		let intro: Grammar = ""
//		let area = MyArea(name: "moldy cave", tags: ["#moldy, #underground, #rocky"])
		let area: Grammar = "#material.wet #area.underground"
		let e1: Grammar = "#colorful-#bodypart.ed #animal"
		let e2: Grammar = "#slippery-#bodypart.ed #flying&animal"
		let intro: Grammar = "You enter the @area. The @area.material squishes under your feet. A @1 is drinking from a nearby stream. You flinch as a "
		let template = SceneTemplate(area: area, entities: [e1, e2], intro: intro)
		let sceneGenerator = SceneGenerator(corpus: corpus)
		let scene = try sceneGenerator.generate(from: template, unique: true)
		print(scene)
		XCTAssertTrue(scene.intro.hasPrefix("You enter the "))
	}
	
	static var allTests = [
		("testGenerator", testGenerator),
	]
}
