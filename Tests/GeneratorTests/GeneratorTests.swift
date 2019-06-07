import XCTest
@testable import Generator

final class GeneratorTests: XCTestCase {
	
	public let corpus = Corpus(
		categories: [
			"body part", "color"
		],
		traits: [
			Trait(categories: ["body part"], words: [.n("feather")], tags: "lightweight", "flying", "sky"),
			Trait(categories: ["color"], adjectives: ["blue", "orange"], tags: []),
		]
	)
	
	func testCorpus() throws {
		try corpus.validate()
	}
	
	func testBadCorpus() throws {
		let badCorpus = Corpus(categories: ["category"], traits: [Trait(categories: ["nonmatching category"], tags: [])])
		XCTAssertThrowsError(try badCorpus.validate())
	}
	
	func testGenerator() throws {
		let generator = Generator(corpus: corpus)
		let constraint = Constraint(word: .adjective, category: "body part")
		let strings = try generator.generate(with: constraint)
		print(strings)
		print(strings.count)
	}
	
	static var allTests = [
		("testGenerator", testGenerator),
	]
}
