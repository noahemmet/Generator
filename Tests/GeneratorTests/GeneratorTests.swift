import XCTest
@testable import Generator

final class GeneratorTests: XCTestCase {
	
	public let corpus = Corpus(
		categories: [
			"body part"
		],
		traits: [
			Trait(categories: ["body part"], words: [.n("feather")], tags: "lightweight", "flying", "sky"),
			Trait(categories: ["color"], adjectives: ["blue", "orange"], tags: []),
		]
	)
	
	func testGenerator() throws {
		let generator = Generator(corpus: corpus)
		let constraint = Constraint(word: .noun, category: "body part")
		let foo = try generator.generate(with: constraint)
	}
	
	static var allTests = [
		("testGenerator", testGenerator),
	]
}
