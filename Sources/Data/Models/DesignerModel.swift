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

// MARK: - DesignerModel

final class DesignerModel: Model {
    
    // MARK: - Properties
    
    static let schema = "designers"
    
    @ID(custom: "id", generatedBy: .user)
    var id: Int?
    
    @Field(key: "name")
    var name: String
    
    @OptionalField(key: "history")
    var history: String?
    
    @Siblings(through: DesignerSilhouettePivotModel.self, from: \.$designer, to: \.$silhouette)
    var silhouettes: [SilhouetteModel]
    
    @Siblings(through: DesignerBrandPivotModel.self, from: \.$designer, to: \.$brand)
    var brandsWorkedAt: [BrandModel]
    
    @Siblings(through: SneakerDesignerPivotModel.self, from: \.$designer, to: \.$sneaker)
    var sneakers: [SneakerModel]
    
    // MARK: - Initializer(s)
    
    init() {}
    
    @discardableResult
    init(id: Int, name: String, history: String?, silhouettes: [SilhouetteModel.IDValue], brandsWorkedAt: [BrandModel.IDValue], on database: Database) async throws {
        self.id = id
        self.name = name
        self.history = history
        
        try await save(on: database)
        
        if !silhouettes.isEmpty {
            let silhouettePivots = silhouettes.map { DesignerSilhouettePivotModel(designerId: id, silhouetteId: $0) }
            
            for silhouettePivot in silhouettePivots {
                try await silhouettePivot.save(on: database)
            }
        }
        
        if !brandsWorkedAt.isEmpty {
            let brandPivots = brandsWorkedAt.map { DesignerBrandPivotModel(designerId: id, brandId: $0) }
            
            for brandPivot in brandPivots {
                try await brandPivot.save(on: database)
            }
        }
    }
}

// MARK: - AsyncMigration

extension DesignerModel {
    
    // MARK: - Create
    
    struct Create: AsyncMigration {
        
        // MARK: - Public Method(s)
        
        func prepare(on database: Database) async throws {
            try await database
                .schema(DesignerModel.schema)
                .id()
                .field("name", .string, .required)
                .field("history", .string)
                .create()
        }
        
        func revert(on database: Database) async throws {
            try await database.schema(DesignerModel.schema).delete()
        }
    }
}

// MARK: - EntityMappable

extension DesignerModel: EntityMappable {
    var toEntity: DesignerEntity {
        get throws {
            guard let id else { throw DomainError.somethingWrong("id is missing in DesignerModel") }
            
            return DesignerEntity(
                id: id,
                name: name,
                history: history,
                silhouettes: try silhouettes.map { try $0.toEntity },
                brandsWorkedAt: try brandsWorkedAt.map { try $0.toEntity }
            )
        }
    }
}
