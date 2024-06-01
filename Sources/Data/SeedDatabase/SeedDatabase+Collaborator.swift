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
    func prepareCollaborators(on database: Database) async throws {
        // TODO: - Populate Collaborators?
    }
    
    func revertCollaborators(on database: Database) async throws {
        try await CollaboratorModel.query(on: database).delete()
    }
}

// MARK: - CollaboratorModel

extension CollaboratorModel {
    enum Collaborators: Int {
        case undefeated
    }
}

private extension CollaboratorModel {
    
    @discardableResult
    convenience init(collaborator: Collaborators, name: String, history: String?, on database: Database) async throws {
        try await self.init(id: collaborator.rawValue, name: name, history: history, on: database)
    }
}
