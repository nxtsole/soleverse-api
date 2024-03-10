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

// MARK: - CreateTodoRequest

struct CreateTodoRequest: Content {
    let title: String
}

// MARK: - EntityMappable

extension CreateTodoRequest: EntityMappable {
    var toEntity: CreateTodoEntity { .init(title: title) }
    
    init(entity: CreateTodoEntity) {
        self.init(title: entity.title)
    }
}
