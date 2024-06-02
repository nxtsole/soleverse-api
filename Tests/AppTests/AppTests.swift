//===----------------------------------------------------------------------===//
//
// This source file is part of the SoleVerse API open source project
//
// Copyright (c) 2023 NXTSOLE and the SoleVerse API project authors
// Licensed under BSD 3-Clause "New" or "Revised" License
//
// See LICENSE for license information
//
// SPDX-License-Identifier: BSD-3-Clause
//
//===----------------------------------------------------------------------===//

@testable import App
import XCTVapor

// MARK: - Application

private extension Application {
    static func makeTestable() async throws -> Application {
        let app = Application(.testing)
        
        try await configure(app)
        try await app.autoRevert()
        try await app.autoMigrate()
        
        return app
    }
}

// MARK: - AppTests

final class AppTests: XCTestCase {
    
    // MARK: - Test(s)
    
    func testGetAllBrands() async throws {
        // Given
        let app = try await Application.makeTestable()
        
        defer { app.shutdown() }
        
        // When
        try app.test(.GET, "api/v1/brands") { response in
            // Then
            XCTAssertEqual(response.status, .ok)
            
            let brands = try response.content.decode([BrandDTO].self)
            
            XCTAssertTrue(brands.contains { $0.name == "Air Jordan" })
        }
    }
}
