//
//  DatabaseTodoRepositoryTests.swift
//
//
//  Created by Emanuel Guerrero on 11/16/23.
//

@testable import Data
import Domain
import FluentSQLiteDriver
import XCTest
import XCTVapor

final class DatabaseTodoRepositoryTests: XCTestCase {
    
    // MARK: - Test(s)
    
    func testCreate() async throws {
        // Given
        let app = Application(.testing)
        app.databases.use(.sqlite(.memory), as: .sqlite)
        app.migrations.add(Todo.Create())
        defer { app.shutdown() }
        
        try await app.autoMigrate()
        
        let eventLoop = app.eventLoopGroup.any()
        
        let sut = DatabaseTodoRepository(.init(application: app, on: eventLoop))
        
        // When
        let entity = try await sut.create(CreateTodoEntity(title: "Hello World"))
        
        // Then
        XCTAssertEqual(entity.title, "Hello World")
        XCTAssertFalse(entity.id.uuidString.isEmpty)
    }
    
    func testRead() async throws {
        // Given
        let app = Application(.testing)
        app.databases.use(.sqlite(.memory), as: .sqlite)
        app.migrations.add(Todo.Create())
        defer { app.shutdown() }
        
        try await app.autoMigrate()
        
        let eventLoop = app.eventLoopGroup.any()
        
        let sut = DatabaseTodoRepository(.init(application: app, on: eventLoop))
        
        let entity1 = try await sut.create(CreateTodoEntity(title: "Hello World"))
        let entity2 = try await sut.create(CreateTodoEntity(title: "Hello World2"))
        
        // When
        let entities = try await sut.read()
        
        // Then
        XCTAssertEqual(entities.count, 2)
        XCTAssertEqual(entities[0].id, entity1.id)
        XCTAssertEqual(entities[1].id, entity2.id)
    }
}
