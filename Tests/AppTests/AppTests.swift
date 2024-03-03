@testable import App
import XCTVapor

final class AppTests: XCTestCase {
    
    // MARK: - Test(s)
    
    func testHelloWorld() async throws {
        let app = Application(.testing)
        defer { app.shutdown() }
        try await configure(app)

        try app.test(.GET, "hello") { response in
            XCTAssertEqual(response.status, .ok)
            XCTAssertEqual(response.body.string, "Hello, world!")
        }
    }
    
    func testCreate() async throws {
        let app = Application(.testing)
        defer { app.shutdown() }
        try await configure(app)
        
        try app.test(.POST, "todos") { request in
            try request.content.encode(["title": "Test"])
        } afterResponse: { response in
            let todo = try response.content.decode(TodoResponse.self)
            XCTAssertEqual(todo.title, "Test")
        }
    }
}
