import XCTest
@testable import Generator

final class GeneratorTests: XCTestCase {
	
	public let corpus = Corpus(
		categories: [
			"body part", "color", "bird", "fish", "swims"
		],
		traits: [
			Trait(words: [.n("feather"), .adj("feathered")],
				  categories: ["body part", "bird"],
				  tags: "lightweight", "flying", "sky"),
			
			Trait(words: [.n("fish"), .adj("fishy"), .adj("scaly")],
				  categories: ["fish"],
				  tags: "swims", "scaly", "slippery"),

			Trait(adjectives: ["blue", "orange"],
				  categories: ["color"],
				  tags: []),
		]
		// should categories just be tags? Are categories just collections of tags?
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
