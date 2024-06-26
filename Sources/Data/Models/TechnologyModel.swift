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
    
    @discardableResult
    init(id: Int, name: String, history: String?, brandId: BrandModel.IDValue, on database: Database) async throws {
        self.id = id
        self.name = name
        self.history = history
        
        $brand.id = brandId
        
        try await save(on: database)
    }
}

// MARK: - AsyncMigration

extension TechnologyModel {
    
    // MARK: - Create
    
    struct Create: AsyncMigration {
        
        // MARK: - Public Method(s)
        
        func prepare(on database: Database) async throws {
            try await database
                .schema(TechnologyModel.schema)
                .field("id", .int, .required, .identifier(auto: false))
                .unique(on: "id")
                .field("name", .string, .required)
                .field("history", .string)
                .field("brand", .int, .required, .references(BrandModel.schema, "id"))
                .create()
        }
        
        func revert(on database: Database) async throws {
            try await database.schema(TechnologyModel.schema).delete()
        }
    }
}

// MARK: - EntityMappable

extension TechnologyModel: EntityMappable {
    var toEntity: TechnologyEntity {
        get throws {
            guard let id else { throw DomainError.somethingWrong("id is missing in TechnologyModel") }
            
            var brandEntity = BrandEntity(id: $brand.id, name: "", history: nil)
            
            if $brand.value != nil {
                brandEntity = try brand.toEntity
            }
            
            return TechnologyEntity(
                id: id,
                name: name,
                history: history,
                brand: brandEntity
            )
        }
    }
}
