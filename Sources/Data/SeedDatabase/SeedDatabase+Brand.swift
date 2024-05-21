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

extension SeedDatabase {
    
    // MARK: - Public Method(s)
    
    func prepareBrands(on database: Database) async throws {
        // TODO: - Populate Brands
    }
    
    func revertBrands(on database: Database) async throws {
        try await BrandModel.query(on: database).delete()
    }
}