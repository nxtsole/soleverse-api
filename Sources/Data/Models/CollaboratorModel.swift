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

import Fluent

// MARK: - CollaboratorModel

final class CollaboratorModel: Model {
    
    // MARK: - Properties
    
    static let schema = "collaborators"
    
    @ID(custom: "id", generatedBy: .user)
    var id: Int?
    
    @Field(key: "name")
    var name: String
    
    @OptionalField(key: "history")
    var history: String?
    
    @Siblings(through: SneakerCollaboratorPivotModel.self, from: \.$collaborator, to: \.$sneaker)
    var sneakers: [SneakerModel]
    
    // MARK: - Initializer(s)
    
    init() {}
    
    init(id: Int, name: String, history: String?) {
        self.id = id
        self.name = name
        self.history = history
    }
}

// MARK: - AsyncMigration

extension CollaboratorModel {
    struct Create: AsyncMigration {
        func prepare(on database: Database) async throws {
            try await database
                .schema(CollaboratorModel.schema)
                .id()
                .field("name", .string, .required)
                .field("history", .string)
                .create()
        }
        
        func revert(on database: Database) async throws {
            try await database.schema(CollaboratorModel.schema).delete()
        }
    }
}
