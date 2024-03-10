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

import Foundation

public struct CreateTodoUseCase {
    
    // MARK: - Properties
    
    private let repository: TodoRepository
    
    // MARK: - Initializer(s)
    
    public init(repository: TodoRepository) {
        self.repository = repository
    }
    
    // MARK: - Public Method(s)
    
    public func create(_ entity: CreateTodoEntity) async throws -> TodoEntity {
        guard !entity.title.isEmpty else { throw DomainError.validation("title cannot be empty") }
        
        return try await repository.create(entity)
    }
}
