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
		
		let entityGenerator = EntityGenerator<MyEntity>(corpus: corpus)
		let entityGrammar: Grammar = "\(adj: "#body part")) \(n: "#sea creature")"
		let entity = try entityGenerator.generate(with: entityGrammar) { (name, tags) -> MyEntity in
			return .init(name: name, tags: tags)
		}
		print(entity)
		
		
		let paragraphGenerator = ParagraphGenerator(entities: [entity])
		let paragraphGrammar: Grammar = "
		let paragraph = paragraphGenerator.generate(on: <#T##Grammar#>)
	}
	
	
	static var allTests = [
		("testGenerator", testGenerator),
	]
}
