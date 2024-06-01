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

// MARK: - TechnologyDTO

struct TechnologyDTO: Content {
    
    // MARK: - Properties
    
    let id: Int
    let name: String
    let history: String?
    let brand: BrandDTO
}

// MARK: - TechnologyEntity

extension TechnologyEntity: DTOMappable {
    var toDTO: TechnologyDTO { TechnologyDTO(id: id, name: name, history: history, brand: brand.toDTO) }
}
