import XCTest
@testable import Generator

final class GeneratorTests: XCTestCase {
	
	public let corpus = Corpus(
		traits:
			animalTraits, instruments
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
		let constraint: Constraint = "adj: #body part"
		let strings = try generator.generate(with: constraint)
		print(strings)
		print(strings.count)
	}
	
	static var allTests = [
		("testGenerator", testGenerator),
	]
}
