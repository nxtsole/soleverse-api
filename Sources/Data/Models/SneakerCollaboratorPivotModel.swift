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

// MARK: - SneakerCollaboratorPivotModel

final class SneakerCollaboratorPivotModel: Model {
    
    // MARK: - Properties
    
    static let schema = "sneaker+collaborator"
    
    @ID(key: .id)
    var id: UUID?
    
    @Parent(key: "sneaker_id")
    var sneaker: SneakerModel
    
    @Parent(key: "collaborator_id")
    var collaborator: CollaboratorModel
    
    // MARK: - Initializer(s)
    
    init() {}
    
    init(id: UUID? = nil, sneakerId: SneakerModel.IDValue, collaboratorId: CollaboratorModel.IDValue) {
        self.id = id
        
        $sneaker.id = sneakerId
        $collaborator.id = collaboratorId
    }
}

// MARK: - AsyncMigration

extension SneakerCollaboratorPivotModel {
    
    // MARK: - Create
    
    struct Create: AsyncMigration {
        
        // MARK: - Public Method(s)
        
        func prepare(on database: Database) async throws {
            try await database
                .schema(SneakerCollaboratorPivotModel.schema)
                .id()
                .field("sneaker_id", .string, .required, .references(SneakerModel.schema, "id", onDelete: .cascade))
                .field("collaborator_id", .int, .required, .references(CollaboratorModel.schema, "id", onDelete: .cascade))
                .create()
        }
        
        func revert(on database: Database) async throws {
            try await database.schema(SneakerCollaboratorPivotModel.schema).delete()
        }
    }
}
