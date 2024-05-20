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
    var id: BrandType?
    
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
    
    init(id: BrandType, name: String, history: String? = nil) {
        self.id = id
        self.name = name
        self.history = history
    }
}

// MARK: - AsyncMigration

extension BrandModel {
    struct Create: AsyncMigration {
        func prepare(on database: Database) async throws {
            let brandType = try await database
                .enum("brand_type")
                .case(BrandType.airJordan.rawValue)
                .create()
            
            try await database
                .schema(BrandModel.schema)
                .field("id", brandType, .required, .identifier(auto: false))
                .unique(on: "id")
                .field("name", .string, .required)
                .field("history", .string)
                .create()
        }
        
        func revert(on database: Database) async throws {
            try await database.schema(BrandModel.schema).delete()
            try await database.enum("brand_type").delete()
        }
    }
}
