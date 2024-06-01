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

// MARK: - SilhouetteController

struct SilhouetteController: RouteCollection {
    
    // MARK: - Public Method(s)
    
    func boot(routes: RoutesBuilder) throws {
        routes.group("silhouettes") { silhouettes in
            silhouettes.group(":silhouetteId") { silhouette in
                silhouette.get(use: read)
            }
        }
    }
    
    // MARK: - Private Method(s)
    
    private func read(request: Request) async throws -> SilhouetteDTO {
        guard let silhouetteId: Int = request.parameters.get(":silhouetteId") else {
            throw Abort(.badRequest, reason: "The silhouette object identifier is required")
        }
        
        return try await request.repository.read(id: silhouetteId).toDTO
    }
}

// MARK: - Request

private extension Request {
    var repository: SilhouetteRepository { application.repositories.make(.silhouette, self) }
}
