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

// MARK: - TodoResponse

struct TodoResponse: Content {
    let id: UUID
    let title: String
}

// MARK: - EntityMappable

extension TodoResponse: EntityMappable {
    var toEntity: TodoEntity {
        TodoEntity(id: id, title: title)
    }
    
    init(entity: TodoEntity) {
        self.init(id: entity.id, title: entity.title)
    }
}
