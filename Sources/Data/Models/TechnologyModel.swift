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

// MARK: - TechnologyModel

final class TechnologyModel: Model {
    
    // MARK: - Properties
    
    static var schema = "technologies"
    
    @ID(custom: "id", generatedBy: .user)
    var id: Int?
    
    @Field(key: "name")
    var name: String
    
    @OptionalField(key: "history")
    var history: String?
    
    @Parent(key: "brand")
    var brand: BrandModel
    
    @Siblings(through: SilhouetteTechnologyPivotModel.self, from: \.$technology, to: \.$silhouette)
    var silhouettes: [SilhouetteModel]
    
    // MARK: - Initializer(s)
    
    init() {}
    
    init(id: Int, name: String, history: String?, brandId: BrandModel.IDValue) {
        self.id = id
        self.name = name
        self.history = history
        
        $brand.id = brandId
    }
}

// MARK: - AsyncMigration

extension TechnologyModel {
    
    // MARK: - Create
    
    struct Create: AsyncMigration {
        
        // MARK: - Public Method(s)
        
        func prepare(on database: Database) async throws {
            let brandType = try await database
                .enum("brand_type")
                .read()
            
            try await database
                .schema(TechnologyModel.schema)
                .id()
                .field("name", .string, .required)
                .field("history", .string)
                .field("brand", brandType, .required, .references(BrandModel.schema, "id"))
                .unique(on: "brand")
                .create()
        }
        
        func revert(on database: Database) async throws {
            try await database.schema(TechnologyModel.schema).delete()
        }
    }
}
