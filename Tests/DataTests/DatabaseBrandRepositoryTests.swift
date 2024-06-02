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

@testable import Data
import Domain
import FluentSQLiteDriver
import XCTest
import XCTVapor

// MARK: - Application

private extension Application {
    static func makeTestable() async throws -> Application {
        let app = Application(.testing)
        app.databases.use(.sqlite(.memory), as: .sqlite)
        app.migrations.add(BrandModel.Create())
        
        try await app.autoMigrate()
        
        return app
    }
}

// MARK: - Request

private extension Request {
    convenience init(application: Application) {
        let eventLoop = application.eventLoopGroup.any()
        
        self.init(application: application, on: eventLoop)
    }
}

// MARK: - SUT

private typealias SUT = DatabaseBrandRepository

// MARK: - DatabaseBrandRepositoryTests

final class DatabaseBrandRepositoryTests: XCTestCase {
    
    // MARK: - Test(s)
    
    func testReadAll() async throws {
        // Given
        let app = try await Application.makeTestable()
        
        defer { app.shutdown() }
        
        let request = Request(application: app)
        
        try await BrandModel(brand: .airJordan, name: "Air Jordan", history: nil, on: request.db)
        
        let sut = SUT(request)
        
        // When
        let entities = try await sut.read()
        
        // Then
        XCTAssertEqual(entities[0].id, BrandModel.Brands.airJordan.rawValue)
    }
}
