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
import Foundation

extension SeedDatabase {
    func prepareAirJordanSneakers(on database: Database) async throws {
        try await SneakerModel(
            id: 0,
            name: "Air Jordan 1 High 'Chicago'",
            history: "Conceptualized by Peter Moore, the Air Jordan 1 High 'Chicago' 1985 shoe changed the way people regarded sneakers forever. This first edition honors the Chicago Bulls team colors in a full-grain leather build complete with sleek Swooshes, Wings branding and a molded collar. Nike Air cushioning is embedded in the midsole, while a modified herringbone outsole provides traction.",
            nickName: "Chicago",
            colorWay: "White/Black-Varsity Red",
            releaseDate: DateComponents(year: 1985, month: 9, day: 14).date,
            retailPrice: nil,
            sku: "4280",
            designers: [.peterMoore],
            collaborators: [],
            brand: .airJordan,
            silhouette: .airJordan(.oneHigh),
            materials: "Leather",
            imageFields: [.lateral, .back, .medial],
            on: database
        )
    }
}
