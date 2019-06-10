import XCTest
@testable import Generator

final class GeneratorTests: XCTestCase {
	
	public let corpus = Corpus(
		categories: [
			Vanilla.fauna
			]
	)
	
	func testCorpus() throws {
		try corpus.validate()
	}
	
	func testGenerator() throws {
		var generator = Generator(corpus: corpus)
		let constraint: Constraint = "adj: #body part"
		let strings = try generator.generate(with: constraint)
		print(strings)
		print(strings.count)
	}
	
	static var allTests = [
		("testGenerator", testGenerator),
	]
}
