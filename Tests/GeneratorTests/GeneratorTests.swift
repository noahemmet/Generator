import XCTest
@testable import Generator

final class GeneratorTests: XCTestCase {
	
	public let corpus = Corpus(
		traits: [
			"n:feather, adj:feathered, adj:feathery, #body part, #bird, #lightweight, #flying, #sky",
			
			"n:horn, adj:horned, adj:horney, #body part, #spikey, #defensive",
			
			"n:horn, #loud, #instrument",
			
			"adj:slippery, #fish",
			
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
		var generator = Generator(corpus: corpus)
		let constraint = Constraint(.adjective(.attributive), "body part")
		let strings = try generator.generate(with: constraint)
		print(strings)
		print(strings.count)
	}
	
	static var allTests = [
		("testGenerator", testGenerator),
	]
}
