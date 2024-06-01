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

// MARK: - DesignerController

struct DesignerController: RouteCollection {
    
    // MARK: - Public Method(s)
    
    func boot(routes: RoutesBuilder) throws {
        routes.group("designers") { designers in
            designers.group(":designerId") { designer in
                designer.get(use: read)
            }
        }
    }
    
    // MARK: - Private Method(s)
    
    private func read(request: Request) async throws -> DesignerDTO {
        guard let designerId: Int = request.parameters.get(":designerId") else {
            throw Abort(.badRequest, reason: "The designer object identifier is required")
        }
        
        return try await request.repository.read(id: designerId).toDTO
    }
}

// MARK: - Request

private extension Request {
    var repository: DesignerRepository { application.repositories.make(.designer, self) }
}
