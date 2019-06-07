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
		let constraint = Constraint(word: .adjective, category: "body part")
		let strings = try generator.generate(with: constraint)
		print(strings)
		print(strings.count)
	}
	
	static var allTests = [
		("testGenerator", testGenerator),
	]
}
