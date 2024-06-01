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
    func prepareDesigners(on database: Database) async throws {
        try await DesignerModel(designer: .peterMoore, name: "Peter Moore", history: nil, silhouettes: [.airJordan(.oneHigh)], brandsWorkedAt: [.airJordan], on: database)
    }
    
    func revertDesigners(on database: Database) async throws {
        try await DesignerModel.query(on: database).delete()
    }
}

// MARK: - DesignerModel

extension DesignerModel {
    enum Designers: Int {
        case peterMoore
    }
}

private extension DesignerModel {
    
    @discardableResult
    convenience init(designer: Designers,
                     name: String,
                     history: String?,
                     silhouettes: [SilhouetteModel.Silhouettes],
                     brandsWorkedAt: [BrandModel.IDValue],
                     on database: Database) async throws {
        try await self.init(id: designer.rawValue, name: name, history: history, silhouettes: silhouettes.map(\.id), brandsWorkedAt: brandsWorkedAt, on: database)
    }
}
