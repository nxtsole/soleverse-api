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

// MARK: - BrandModel

final class BrandModel: Model {
    
    // MARK: - Properties
    
    static let schema = "brands"
    
    @ID(custom: "id", generatedBy: .user)
    var id: Int?
    
    @Field(key: "name")
    var name: String
    
    @OptionalField(key: "history")
    var history: String?
    
    @Siblings(through: DesignerBrandPivotModel.self, from: \.$brand, to: \.$designer)
    var designers: [DesignerModel]
    
    @Children(for: \.$brand)
    var sneakers: [SneakerModel]
    
    // MARK: - Initializer(s)
    
    init() {}
    
    @discardableResult
    init(id: Int, name: String, history: String?, on database: Database) async throws {
        self.id = id
        self.name = name
        self.history = history
        
        try await save(on: database)
    }
}

// MARK: - AsyncMigration

extension BrandModel {
    
    // MARK: - Create
    
    struct Create: AsyncMigration {
        
        // MARK: - Public Method(s)
        
        func prepare(on database: Database) async throws {
            try await database
                .schema(BrandModel.schema)
                .field("id", .int, .required, .identifier(auto: false))
                .unique(on: "id")
                .field("name", .string, .required)
                .field("history", .string)
                .create()
        }
        
        func revert(on database: Database) async throws {
            try await database.schema(BrandModel.schema).delete()
        }
    }
}

// MARK: - EntityMappable

extension BrandModel: EntityMappable {
    var toEntity: BrandEntity {
        get throws {
            guard let id else { throw DomainError.somethingWrong("id is missing in BrandModel") }
            return BrandEntity(id: id, name: name, history: history)
        }
    }
}
