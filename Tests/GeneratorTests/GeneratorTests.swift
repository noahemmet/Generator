import XCTest
@testable import Generator

final class GeneratorTests: XCTestCase {
	
	public let corpus = Corpus(
		traits: [
			Trait(words: [.n("feather"), .adj("feathered")],
				  tags: "body part", "bird", "lightweight", "flying", "sky"),
			
			Trait(words: [.n("horn"), .adj("horned")],
				  tags: "body part", "spikey", "defensive"),
			
			Trait(words: [.n("fish"), .adj("fishy"), .adj("scaly")],
				  tags: "fishy", "swims", "scaly", "slippery"),

			Trait(adjectives: ["blue", "orange"],
				  tags: ["color"]),
		]
	)
	
	func testCorpus() throws {
		try corpus.validate()
	}
	
	func testBadCorpus() throws {
		let badCorpus = Corpus(traits: [Trait(tags: ["bad tag"])])
//		XCTAssertThrowsError(try badCorpus.validate())
	}
	
	func testGenerator() throws {
		let generator = Generator(corpus: corpus)
		let constraint = Constraint(word: .adjective, tags: "body part")
		let strings = try generator.generate(with: constraint)
		print(strings)
		print(strings.count)
	}
	
	static var allTests = [
		("testGenerator", testGenerator),
	]
}
