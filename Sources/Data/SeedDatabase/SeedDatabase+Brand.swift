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

// MARK: - SeedDatabase

extension SeedDatabase {
    func prepareBrands(on database: Database) async throws {
        try await BrandModel(brand: .airJordan, name: "Air Jordan", history: nil, on: database)
    }
    
    func revertBrands(on database: Database) async throws {
        try await BrandModel.query(on: database).delete()
    }
}

// MARK: - BrandModel

extension BrandModel {
    enum Brands: Int {
        case airJordan
    }
    
    @discardableResult
    convenience init(brand: Brands, name: String, history: String?, on database: Database) async throws {
        try await self.init(id: brand.rawValue, name: name, history: history, on: database)
    }
}
