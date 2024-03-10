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

// MARK: - Todo

final class Todo: Model {
    static let schema = "todos"
    
    @ID(key: .id)
    var id: UUID?

    @Field(key: "title")
    var title: String

    init() { }

    init(id: UUID? = nil, title: String) {
        self.id = id
        self.title = title
    }
}

// MARK: - AsyncMigration

extension Todo {
    struct Create: AsyncMigration {
        func prepare(on database: Database) async throws {
            try await database.schema("todos")
                .id()
                .field("title", .string, .required)
                .create()
        }

        func revert(on database: Database) async throws {
            try await database.schema("todos").delete()
        }
    }
}

// MARK: - EntityMappable

extension Todo: EntityMappable {
    var toEntity: TodoEntity {
        get throws {
            guard let id else { throw DomainError.somethingWrong("id is missing") }
            return TodoEntity(id: id, title: title)
        }
    }
    
    convenience init(entity: TodoEntity) {
        self.init(id: entity.id, title: entity.title)
    }
}
