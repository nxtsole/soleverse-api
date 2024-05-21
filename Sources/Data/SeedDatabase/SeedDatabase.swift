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

struct SeedDatabase: AsyncMigration {
    
    // MARK: - Public Method(s)
    
    func prepare(on database: Database) async throws {
        try await prepareBrands(on: database)
        try await prepareTechnologies(on: database)
        try await prepareSilhouettes(on: database)
        try await prepareCollaborators(on: database)
        try await prepareDesigners(on: database)
        try await prepareSneakers(on: database)
    }
    
    func revert(on database: Database) async throws {
        try await revertSneakers(on: database)
        try await revertDesigners(on: database)
        try await revertCollaborators(on: database)
        try await revertSilhouetes(on: database)
        try await revertTechnologies(on: database)
        try await revertBrands(on: database)
    }
}
