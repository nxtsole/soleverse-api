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

// MARK: - SilhouetteDTO

struct SilhouetteDTO: Content {
    
    // MARK: - Properties
    
    let id: Int
    let name: String
    let brand: BrandDTO
    let history: String?
    let technologies: [TechnologyDTO]
}

// MARK: - SilhouetteEntity

extension SilhouetteEntity: DTOMappable {
    var toDTO: SilhouetteDTO {
        SilhouetteDTO(
            id: id,
            name: name,
            brand: brand.toDTO,
            history: history,
            technologies: technologies.map(\.toDTO)
        )
    }
}
