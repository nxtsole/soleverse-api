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
        try await TechnologyModel(technology: .air, name: "Air", history: nil, brandId: .airJordan, on: database)
    }
    
    func revertTechnologies(on database: Database) async throws {
        try await TechnologyModel.query(on: database).delete()
    }
}

// MARK: - TechnologyModel

extension TechnologyModel {
    enum Technologies: Int {
        case air
    }
}

private extension TechnologyModel {
    
    @discardableResult
    convenience init(technology: Technologies,
                     name: String,
                     history: String?,
                     brandId: BrandModel.IDValue,
                     on database: Database) async throws {
        try await self.init(id: technology.rawValue, name: name, history: history, brandId: brandId, on: database)
    }
}
