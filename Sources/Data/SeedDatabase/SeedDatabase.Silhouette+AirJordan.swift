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
    func prepareAirJordanSilhouettes(on database: Database) async throws {
        try await SilhouetteModel(silhouette: .oneHigh, name: "Air Jordan 1 High", history: nil, brand: .airJordan, technologies: [.air], on: database)
        try await SilhouetteModel(silhouette: .oneLow, name: "Air Jordan 1 Low", history: nil, brand: .airJordan, technologies: [.air], on: database)
        try await SilhouetteModel(silhouette: .skyOneHigh, name: "Sky Jordan 1 High", history: nil, brand: .airJordan, technologies: [], on: database)
        try await SilhouetteModel(silhouette: .two, name: "Air Jordan 2", history: nil, brand: .airJordan, technologies: [.air], on: database)
        try await SilhouetteModel(silhouette: .twoLow, name: "Air Jordan 2 Low", history: nil, brand: .airJordan, technologies: [.air], on: database)
        try await SilhouetteModel(silhouette: .three, name: "Air Jordan 3", history: nil, brand: .airJordan, technologies: [.air], on: database)
        try await SilhouetteModel(silhouette: .four, name: "Air Jordan 4", history: nil, brand: .airJordan, technologies: [.air], on: database)
    }
}

// MARK: - Silhouettes

extension SilhouetteModel.Silhouettes {
    enum AirJordan: Int {
        case oneHigh
        case oneLow
        case skyOneHigh
        case two
        case twoLow
        case three
        case four
    }
}

// MARK: - SilhouetteModel

private extension SilhouetteModel {
    
    @discardableResult
    convenience init(silhouette: Silhouettes.AirJordan,
                     name: String,
                     history: String?,
                     brand: BrandModel.Brands,
                     technologies: [TechnologyModel.Technologies],
                     on database: Database) async throws {
        try await self.init(
            silhouette: .airJordan(silhouette),
            name: name,
            history: history,
            brandId: brand.rawValue,
            technologies: technologies,
            on: database
        )
    }
}
