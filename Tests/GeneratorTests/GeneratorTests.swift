import XCTest
@testable import Generator

final class GeneratorTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Generator().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
