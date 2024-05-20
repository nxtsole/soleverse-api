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

final class DesignerBrandPivotModel: Model {
    
    // MARK: - Properties
    
    static let schema = "designer+brand"
    
    @ID(key: .id)
    var id: UUID?
    
    @Parent(key: "designer_id")
    var designer: DesignerModel
    
    @Parent(key: "brand_id")
    var brand: BrandModel
    
    // MARK: - Initializer(s)
    
    init() {}
    
    init(id: UUID? = nil, designerId: DesignerModel.IDValue, brandId: BrandModel.IDValue) {
        self.id = id
        
        $designer.id = designerId
        $brand.id = brandId
    }
}

// MARK: - AsyncMigration

extension DesignerBrandPivotModel {
    struct Create: AsyncMigration {
        func prepare(on database: Database) async throws {
            let brandType = try await database
                .enum("brand_type")
                .read()
            
            try await database
                .schema(DesignerBrandPivotModel.schema)
                .id()
                .field("designer_id", .int, .required, .references(DesignerModel.schema, "id", onDelete: .cascade))
                .field("brand_id", brandType, .required, .references(BrandModel.schema, "id", onDelete: .cascade))
                .create()
        }
        
        func revert(on database: Database) async throws {
            try await database.schema(DesignerBrandPivotModel.schema).delete()
        }
    }
}
