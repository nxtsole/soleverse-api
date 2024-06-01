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

// MARK: - SilhouetteTechnologyPivotModel

final class SilhouetteTechnologyPivotModel: Model {
    
    // MARK: - Properties
    
    static var schema = "silhouette+technology"
    
    @ID(key: .id)
    var id: UUID?
    
    @Parent(key: "silhouette_id")
    var silhouette: SilhouetteModel
    
    @Parent(key: "technology_id")
    var technology: TechnologyModel
    
    // MARK: - Initializer(s)
    
    init() {}
    
    init(id: UUID? = nil, silhouetteId: SilhouetteModel.IDValue, technologyId: TechnologyModel.IDValue) {
        self.id = id
        
        $silhouette.id = silhouetteId
        $technology.id = technologyId
    }
}

// MARK: - AsyncMigration

extension SilhouetteTechnologyPivotModel {
    
    // MARK: - Create
    
    struct Create: AsyncMigration {
        
        // MARK: - Public Method(s)
        
        func prepare(on database: Database) async throws {
            try await database
                .schema(SilhouetteTechnologyPivotModel.schema)
                .id()
                .field("silhouette_id", .string, .required, .references(SilhouetteModel.schema, "id", onDelete: .cascade))
                .field("technology_id", .int, .required, .references(TechnologyModel.schema, "id", onDelete: .cascade))
                .create()
        }
        
        func revert(on database: Database) async throws {
            try await database.schema(SilhouetteTechnologyPivotModel.schema).delete()
        }
    }
}
