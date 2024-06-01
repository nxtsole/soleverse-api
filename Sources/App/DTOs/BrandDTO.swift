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

// MARK: - BrandDTO

struct BrandDTO: Content {
    
    // MARK: - Properties
    
    let id: BrandType
    let name: String
    let history: String?
}

// MARK: - BrandEntity

extension BrandEntity: DTOMappable {
    var toDTO: BrandDTO { BrandDTO(id: id, name: name, history: history) }
}
