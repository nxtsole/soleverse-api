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

import Fluent

// MARK: - SeedDatabase

extension SeedDatabase {
    func prepareSneakers(on database: Database) async throws {
        try await prepareAirJordanSneakers(on: database)
    }
    
    func revertSneakers(on database: Database) async throws {
        try await SneakerModel.query(on: database).delete()
    }
}

// MARK: - SneakerModel

extension SneakerModel {

    @discardableResult
    convenience init(id: Int,
                     name: String?,
                     history: String?,
                     nickName: String?,
                     colorWay: String?,
                     releaseDate: Date?,
                     retailPrice: Double?,
                     sku: String?,
                     designers: [DesignerModel.Designers],
                     collaborators: [CollaboratorModel.Collaborators],
                     brand: BrandModel.Brands,
                     silhouette: SilhouetteModel.Silhouettes?,
                     materials: String?,
                     imageFields: Image.Options?,
                     on database: Database) async throws {
        try await self.init(
            id: brand.modelId(id),
            name: name,
            history: history,
            nickName: nickName,
            colorWay: colorWay,
            releaseDate: releaseDate,
            retailPrice: retailPrice,
            sku: sku,
            designers: designers.map(\.rawValue),
            collaborators: collaborators.map(\.rawValue),
            brand: brand.rawValue,
            silhouette: silhouette.flatMap { $0.id },
            materials: materials,
            imageFields: imageFields,
            on: database
        )
    }
}
