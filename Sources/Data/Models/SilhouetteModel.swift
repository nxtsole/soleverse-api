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

// MARK: - SilhouetteModel

final class SilhouetteModel: Model {
    
    // MARK: - Properties
    
    static var schema = "silhouettes"
    
    @ID(custom: "id", generatedBy: .user)
    var id: String?
    
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
    
    @discardableResult
    init(id: String, name: String, history: String?, brandId: BrandModel.IDValue, technologies: [TechnologyModel.IDValue], on database: Database) async throws {
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
            try await database
                .schema(SilhouetteModel.schema)
                .field("id", .string, .required, .identifier(auto: false))
                .unique(on: "id")
                .field("name", .string, .required)
                .field("history", .string)
                .field("brand", .int, .required, .references(BrandModel.schema, "id"))
                .unique(on: "brand")
                .create()
        }
        
        func revert(on database: Database) async throws {
            try await database.schema(SilhouetteModel.schema).delete()
        }
    }
}

// MARK: - EntityMappable

extension SilhouetteModel: EntityMappable {
    var toEntity: SilhouetteEntity {
        get throws {
            guard let id else { throw DomainError.somethingWrong("id is missing in SilhouetteModel") }
            
            var brandEntity = BrandEntity(id: $brand.id, name: "", history: nil)
            
            if $brand.value != nil {
                brandEntity = try brand.toEntity
            }
            
            var technologyEntities = [TechnologyEntity]()
            
            if $technologies.value != nil {
                technologyEntities = try technologies.map { try $0.toEntity }
            }
            
            return SilhouetteEntity(
                id: id,
                name: name,
                brand: brandEntity,
                history: history,
                technologies: technologyEntities
            )
        }
    }
}
