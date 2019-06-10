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
		var generator = Filter(corpus: corpus)
		let constraint: Constraint = "adj: #body part"
		let strings = try generator.filter(with: constraint)
		print(strings)
		print(generator.corpus.tagsByFrequency)
		XCTAssertFalse(strings.isEmpty)
	}
	
	
	func testSceneGenerator() throws {
		
		var generator = Filter(corpus: corpus)
		let constraint: Constraint = "n: #entity"
		let strings = try! generator.filter(with: constraint)
		print(strings)
		XCTAssertFalse(strings.isEmpty)
	}
	static var allTests = [
		("testGenerator", testGenerator),
	]
}
