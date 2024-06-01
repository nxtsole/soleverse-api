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
import Vapor

// MARK: - CollaboratorController

struct CollaboratorController: RouteCollection {
    
    // MARK: - Public Method(s)
    
    func boot(routes: RoutesBuilder) throws {
        routes.group("collaborators") { collaborators in
            collaborators.group(":collaboratorId") { collaborator in
                collaborator.get(use: read)
            }
        }
    }
    
    // MARK: - Private Method(s)
    
    private func read(request: Request) async throws -> CollaboratorDTO {
        guard let collaboratorId: Int = request.parameters.get(":collaboratorId") else {
            throw Abort(.badRequest, reason: "The collaborator object identifier is required")
        }
        
        return try await request.repository.read(id: collaboratorId).toDTO
    }
}

// MARK: - Request

private extension Request {
    var repository: CollaboratorRepository { application.repositories.make(.collaborator, self) }
}
