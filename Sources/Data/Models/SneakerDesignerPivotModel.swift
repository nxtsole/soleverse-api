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

// MARK: - DesignerBrandPivotModel

final class SneakerDesignerPivotModel: Model {
    
    // MARK: - Properties
    
    static let schema = "sneaker+designer"
    
    @ID(key: .id)
    var id: UUID?
    
    @Parent(key: "sneaker_id")
    var sneaker: SneakerModel
    
    @Parent(key: "designer_id")
    var designer: DesignerModel
    
    // MARK: - Initializer(s)
    
    init() {}
    
    init(id: UUID? = nil, sneakerId: SneakerModel.IDValue, designerId: DesignerModel.IDValue) {
        self.id = id
        
        $sneaker.id = sneakerId
        $designer.id = designerId
    }
}

// MARK: - AsyncMigration

extension SneakerDesignerPivotModel {
    
    // MARK: - Create
    
    struct Create: AsyncMigration {
        
        // MARK: - Public Method(s)
        
        func prepare(on database: Database) async throws {
            try await database
                .schema(SneakerDesignerPivotModel.schema)
                .id()
                .field("sneaker_id", .string, .required, .references(SneakerModel.schema, "id", onDelete: .cascade))
                .field("designer_id", .int, .required, .references(DesignerModel.schema, "id", onDelete: .cascade))
                .create()
        }
        
        func revert(on database: Database) async throws {
            try await database.schema(SneakerDesignerPivotModel.schema).delete()
        }
    }
}
