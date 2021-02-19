import XCTest
@testable import LocalizabelManager

final class LocalizabelManagerTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(LocalizabelManager().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
