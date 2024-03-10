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

import Domain
import Fluent
import Vapor

// MARK: - DatabaseTodoRepository

public struct DatabaseTodoRepository: TodoRepository {
    
    // MARK: - Properties
    
    private let request: Request
    
    // MARK: - Initializer(s)
    
    public init(_ request: Request) {
        self.request = request
    }
    
    // MARK: - Public Method(s)
    
    public func create(_ entity: CreateTodoEntity) async throws -> TodoEntity {
        let model = Todo(entity: entity)
        try await model.save(on: request.db)
        return try model.toEntity
    }
    
    public func read() async throws -> [TodoEntity] {
        try await Todo.query(on: request.db).all().map { try $0.toEntity }
    }
    
    public func read(id: UUID) async throws -> TodoEntity {
        guard let model = try await Todo.find(id, on: request.db) else {
            throw Abort(.notFound)
        }
        return try model.toEntity
    }
    
    public func delete(id: UUID) async throws {
        guard let model = try await Todo.find(id, on: request.db) else {
            throw Abort(.notFound)
        }
        try await model.delete(on: request.db)
    }
}

// MARK: - Todo

private extension Todo {
    convenience init(entity: CreateTodoEntity) {
        self.init(title: entity.title)
    }
}
