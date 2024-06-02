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

// MARK: - CollaboratorDTO

struct CollaboratorDTO: Content {
    
    // MARK: - Properties
    
    let id: Int
    let name: String?
    let history: String?
}

// MARK: - CollaboratorEntity

extension CollaboratorEntity: DTOMappable {
    var toDTO: CollaboratorDTO { CollaboratorDTO(id: id, name: name.isEmpty ? nil : name, history: history) }
}
