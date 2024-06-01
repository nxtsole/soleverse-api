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

// MARK: - BrandController

struct BrandController: RouteCollection {
    
    // MARK: - Public Method(s)
    
    func boot(routes: RoutesBuilder) throws {
        routes.group("brands") { brands in
            brands.get(use: readAll)
            brands.group(":brandId") { brand in
                brand.get(use: read)
            }
        }
    }
    
    // MARK: - Private Method(s)
    
    private func readAll(request: Request) async throws -> [BrandDTO] {
        try await request.repository.read().map(\.toDTO)
    }
    
    private func read(request: Request) async throws -> BrandDTO {
        guard let brandId = request.parameters.get(":brandId") else {
            throw Abort(.badRequest, reason: "The brand type is required")
        }
        
        guard let brandType = BrandType(rawValue: brandId) else {
            throw Abort(.badRequest, reason: "Given brand type is not supported yet")
        }
        
        return try await request.repository.read(id: brandType).toDTO
    }
}

// MARK: - Request

private extension Request {
    var repository: BrandRepository { application.repositories.make(.brand, self) }
}
