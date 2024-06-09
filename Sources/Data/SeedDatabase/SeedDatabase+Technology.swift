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
    func prepareTechnologies(on database: Database) async throws {
        try await TechnologyModel(technology: .air, name: "Air", history: nil, brand: .airJordan, on: database)
        try await TechnologyModel(technology: .zoomAir, name: "Zoom Air", history: nil, brand: .airJordan, on: database)
    }
    
    func revertTechnologies(on database: Database) async throws {
        try await TechnologyModel.query(on: database).delete()
    }
}

// MARK: - TechnologyModel

extension TechnologyModel {
    enum Technologies: Int {
        case air
        case zoomAir
    }
}

private extension TechnologyModel {
    
    @discardableResult
    convenience init(technology: Technologies,
                     name: String,
                     history: String?,
                     brand: BrandModel.Brands,
                     on database: Database) async throws {
        try await self.init(id: technology.rawValue, name: name, history: history, brandId: brand.rawValue, on: database)
    }
}
