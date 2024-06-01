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

// MARK: - SneakerDTO

struct SneakerDTO: Content {
    
    // MARK: - Properties
    
    let id: String
    let name: String?
    let history: String?
    let nickName: String?
    let colorWay: String?
    let releaseDate: Date?
    let retailPrice: Double?
    let sku: String?
    let designers: [DesignerDTO]
    let collaborators: [CollaboratorDTO]
    let brand: BrandDTO
    let silhouette: SilhouetteDTO?
    let materials: String?
    let image: ImageDTO?
}

// MARK: - ImageDTO

extension SneakerDTO {
    struct ImageDTO: Content {
        
        // MARK: - Properties
        
        let front: String?
        let back: String?
        let medial: String?
        let leftMedial: String?
        let rightMedial: String?
        let lateral: String?
        let leftLateral: String?
        let rightLateral: String?
    }
}

// MARK: - SneakerEntity

extension SneakerEntity: DTOMappable {
    var toDTO: SneakerDTO {
        SneakerDTO(
            id: id,
            name: name,
            history: history,
            nickName: nickName,
            colorWay: colorWay,
            releaseDate: releaseDate,
            retailPrice: retailPrice,
            sku: sku,
            designers: designers.map(\.toDTO),
            collaborators: collaborators.map(\.toDTO),
            brand: brand.toDTO,
            silhouette: silhouette.flatMap { $0.toDTO },
            materials: materials,
            image: image.flatMap { $0.toDTO }
        )
    }
}

// MARK: - ImageEntity

extension SneakerEntity.ImageEntity: DTOMappable {
    var toDTO: SneakerDTO.ImageDTO {
        SneakerDTO.ImageDTO(
            front: front,
            back: back,
            medial: medial,
            leftMedial: leftMedial,
            rightMedial: rightMedial,
            lateral: lateral,
            leftLateral: leftLateral,
            rightLateral: rightLateral
        )
    }
}
