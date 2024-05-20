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

// MARK: - DesignerSilhouettePivotModel

final class DesignerSilhouettePivotModel: Model {
    
    // MARK: - Properties
    
    static var schema = "designer+silhouette"
    
    @ID(key: .id)
    var id: UUID?
    
    @Parent(key: "designer_id")
    var designer: DesignerModel
    
    @Parent(key: "silhouette_id")
    var silhouette: SilhouetteModel
    
    // MARK: - Initializer(s)
    
    init() {}
    
    init(id: UUID? = nil, designerId: DesignerModel.IDValue, silhouetteId: SilhouetteModel.IDValue) {
        self.id = id
        
        $designer.id = designerId
        $silhouette.id = silhouetteId
    }
}

// MARK: - AsyncMigration

extension DesignerSilhouettePivotModel {
    struct Create: AsyncMigration {
        func prepare(on database: Database) async throws {
            try await database
                .schema(DesignerSilhouettePivotModel.schema)
                .id()
                .field("designer_id", .int, .required, .references(DesignerModel.schema, "id", onDelete: .cascade))
                .field("silhouette_id", .int, .required, .references(SilhouetteModel.schema, "id", onDelete: .cascade))
                .create()
        }
        
        func revert(on database: Database) async throws {
            try await database.schema(DesignerSilhouettePivotModel.schema).delete()
        }
    }
}
