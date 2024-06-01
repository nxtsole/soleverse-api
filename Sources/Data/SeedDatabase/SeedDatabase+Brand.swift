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

extension SeedDatabase {
    func prepareBrands(on database: Database) async throws {
        for brand in BrandType.allCases {
            switch brand {
            case .airJordan:
                try await BrandModel(id: brand, name: "Air Jordan", history: nil, on: database)
            }
        }
    }
    
    func revertBrands(on database: Database) async throws {
        try await BrandModel.query(on: database).delete()
    }
}
