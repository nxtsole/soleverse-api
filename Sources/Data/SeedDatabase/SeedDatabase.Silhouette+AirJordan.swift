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
        try await SilhouetteModel(silhouette: .five, name: "Air Jordan 5", history: nil, brand: .airJordan, technologies: [.air], on: database)
        try await SilhouetteModel(silhouette: .six, name: "Air Jordan 6", history: nil, brand: .airJordan, technologies: [.air], on: database)
        try await SilhouetteModel(silhouette: .seven, name: "Air Jordan 7", history: nil, brand: .airJordan, technologies: [.air], on: database)
        try await SilhouetteModel(silhouette: .skySeven, name: "Sky Jordan 7", history: nil, brand: .airJordan, technologies: [], on: database)
        try await SilhouetteModel(silhouette: .eight, name: "Air Jordan 8", history: nil, brand: .airJordan, technologies: [.air], on: database)
        try await SilhouetteModel(silhouette: .nine, name: "Air Jordan 9", history: nil, brand: .airJordan, technologies: [.air], on: database)
        try await SilhouetteModel(silhouette: .ten, name: "Air Jordan 10", history: nil, brand: .airJordan, technologies: [.air], on: database)
        try await SilhouetteModel(silhouette: .eleven, name: "Air Jordan 11", history: nil, brand: .airJordan, technologies: [.air], on: database)
        try await SilhouetteModel(silhouette: .elevenLowIE, name: "Air Jordan 11 Low IE", history: nil, brand: .airJordan, technologies: [.air], on: database)
        try await SilhouetteModel(silhouette: .tweleve, name: "Air Jordan 12", history: nil, brand: .airJordan, technologies: [.air], on: database)
        try await SilhouetteModel(silhouette: .skyEleven, name: "Sky Jordan 11", history: nil, brand: .airJordan, technologies: [], on: database)
        try await SilhouetteModel(silhouette: .thirteen, name: "Air Jordan 13", history: nil, brand: .airJordan, technologies: [.zoomAir], on: database)
        try await SilhouetteModel(silhouette: .thirteenLow, name: "Air Jordan 13 Low", history: nil, brand: .airJordan, technologies: [.zoomAir], on: database)
        try await SilhouetteModel(silhouette: .jumpmanProQuick, name: "Jumpman Pro Quick", history: nil, brand: .airJordan, technologies: [], on: database)
        try await SilhouetteModel(silhouette: .fourteen, name: "Air Jordan 14", history: nil, brand: .airJordan, technologies: [.zoomAir], on: database)
        try await SilhouetteModel(silhouette: .jumpmanTeamTwo, name: "Jordan Jumpman Team 2", history: nil, brand: .airJordan, technologies: [], on: database)
        try await SilhouetteModel(silhouette: .fourteenLow, name: "Air Jordan 14 Low", history: nil, brand: .airJordan, technologies: [.zoomAir], on: database)
        try await SilhouetteModel(silhouette: .fifteen, name: "Air Jordan 15", history: nil, brand: .airJordan, technologies: [.zoomAir], on: database)
        try await SilhouetteModel(silhouette: .fifteenLow, name: "Air Jordan 15 Low", history: nil, brand: .airJordan, technologies: [.zoomAir], on: database)
        try await SilhouetteModel(silhouette: .trunnerLX, name: "Jordan Trunner LX", history: nil, brand: .airJordan, technologies: [.air], on: database)
        try await SilhouetteModel(silhouette: .sixteen, name: "Air Jordan 16", history: nil, brand: .airJordan, technologies: [.zoomAir], on: database)
        try await SilhouetteModel(silhouette: .elevenLow, name: "Air Jordan 11 Low", history: nil, brand: .airJordan, technologies: [.air], on: database)
        try await SilhouetteModel(silhouette: .sixteenLow, name: "Air Jordan 16 Low", history: nil, brand: .airJordan, technologies: [.zoomAir], on: database)
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
        case five
        case six
        case seven
        case skySeven
        case eight
        case nine
        case ten
        case eleven
        case elevenLowIE
        case tweleve
        case skyEleven
        case thirteen
        case thirteenLow
        case jumpmanProQuick
        case fourteen
        case jumpmanTeamTwo
        case fourteenLow
        case fifteen
        case fifteenLow
        case trunnerLX
        case sixteen
        case elevenLow
        case sixteenLow
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
