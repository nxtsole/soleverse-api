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

// MARK: - SilhouetteModel

final class SilhouetteModel: Model {
    
    // MARK: - Properties
    
    static var schema = "silhouettes"
    
    @ID(custom: "id", generatedBy: .user)
    var id: Int?
    
    @Field(key: "name")
    var name: String
    
    @OptionalField(key: "history")
    var history: String?
    
    @Parent(key: "brand")
    var brand: BrandModel
    
    @Siblings(through: SilhouetteTechnologyPivotModel.self, from: \.$silhouette, to: \.$technology)
    var technologies: [TechnologyModel]
    
    @Siblings(through: DesignerSilhouettePivotModel.self, from: \.$silhouette, to: \.$designer)
    var designers: [DesignerModel]
    
    @Children(for: \.$silhouette)
    var sneakers: [SneakerModel]
    
    // MARK: - Initializer(s)
    
    init() {}
    
    init(id: Int, name: String, history: String?, brandId: BrandModel.IDValue, technologies: [TechnologyModel.IDValue], on database: Database) async throws {
        self.id = id
        self.name = name
        self.history = history
        
        $brand.id = brandId
        
        try await save(on: database)
        
        guard !technologies.isEmpty else { return }
        
        let pivots = technologies.map { SilhouetteTechnologyPivotModel(silhouetteId: id, technologyId: $0) }
        
        for pivot in pivots {
            try await pivot.save(on: database)
        }
    }
}

// MARK: - AsyncMigration

extension SilhouetteModel {
    
    // MARK: - Create
    
    struct Create: AsyncMigration {
        
        // MARK: - Public Method(s)
        
        func prepare(on database: Database) async throws {
            let brandType = try await database
                .enum("brand_type")
                .read()
            
            try await database
                .schema(SilhouetteModel.schema)
                .id()
                .field("name", .string, .required)
                .field("history", .string)
                .field("brand", brandType, .required, .references(BrandModel.schema, "id"))
                .unique(on: "brand")
                .create()
        }
        
        func revert(on database: Database) async throws {
            try await database.schema(SilhouetteModel.schema).delete()
        }
    }
}
