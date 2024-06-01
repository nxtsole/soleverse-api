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

// MARK: - SneakerController

struct SneakerController: RouteCollection {
    
    // MARK: - Public Method(s)
    
    func boot(routes: RoutesBuilder) throws {
        routes.group("sneakers") { sneakers in
            sneakers.group(":sneakerId") { sneaker in
                sneaker.get(use: read)
            }
        }
    }
    
    // MARK: - Private Method(s)
    
    private func read(request: Request) async throws -> SneakerDTO {
        guard let sneakerId = request.parameters.get(":sneakerId") else {
            throw Abort(.badRequest, reason: "The sneaker object identifier is required")
        }
        
        return try await request.repository.read(id: sneakerId).toDTO
    }
}

// MARK: - Request

private extension Request {
    var repository: SneakerRepository { application.repositories.make(.sneaker, self) }
}
