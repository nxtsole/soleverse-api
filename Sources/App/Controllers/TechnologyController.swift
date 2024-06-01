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

// MARK: - TechnologyController

struct TechnologyController: RouteCollection {
    
    // MARK: - Public Method(s)
    
    func boot(routes: Vapor.RoutesBuilder) throws {
        routes.group("technologies") { technologies in
            technologies.group(":technologyId") { technology in
                technology.get(use: read)
            }
        }
    }
    
    // MARK: - Private Method(s)
    
    private func read(request: Request) async throws -> TechnologyDTO {
        guard let technologyId: Int = request.parameters.get("technologyId") else {
            throw Abort(.badRequest, reason: "The technology object identifier is required")
        }
        
        return try await request.repository.read(id: technologyId).toDTO
    }
}

// MARK: - Request

private extension Request {
    var repository: TechnologyRepository { application.repositories.make(.technology, self) }
}
