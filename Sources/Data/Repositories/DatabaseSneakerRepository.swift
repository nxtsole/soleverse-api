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
import Vapor

public struct DatabaseSneakerRepository: SneakerRepository {
    
    // MARK: - Properties
    
    private let request: Request
    
    // MARK: - Initializer(s)
    
    public init(_ request: Request) {
        self.request = request
    }
    
    // MARK: - Public Method(s)
    
    public func read(id: String) async throws -> SneakerEntity {
        let model = try await SneakerModel
            .query(on: request.db)
            .filter(\.$id == id)
            .with(\.$brand)
            .with(\.$designers)
            .with(\.$collaborators)
            .with(\.$silhouette) { silhouette in
                silhouette.with(\.$technologies)
            }
            .first()
        
        guard let model else { throw Abort(.notFound) }
        
        return try model.toEntity
    }
}
