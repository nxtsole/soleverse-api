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
    func prepareSilhouettes(on database: Database) async throws {
        try await prepareAirJordanSilhouettes(on: database)
    }
    
    func revertSilhouetes(on database: Database) async throws {
        try await SilhouetteModel.query(on: database).delete()
    }
}

// MARK: - SilhouetteModel

extension SilhouetteModel {
    enum Silhouettes {
        case airJordan(AirJordan)
        
        var id: String {
            switch self {
            case let .airJordan(airJordan):
                BrandModel.Brands.airJordan.silhouetteId(airJordan)
            }
        }
    }
    
    @discardableResult
    convenience init(silhouette: Silhouettes,
                     name: String,
                     history: String?,
                     brandId: BrandModel.IDValue,
                     technologies: [TechnologyModel.Technologies],
                     on database: Database) async throws {
        try await self.init(
            id: silhouette.id,
            name: name,
            history: history,
            brandId: brandId,
            technologies: technologies.map(\.rawValue),
            on: database
        )
    }
}

// MARK: - Brands

private extension BrandModel.Brands {
    func silhouetteId<R: RawRepresentable>(_ id: R) -> String where R.RawValue == Int {
        "\(id.rawValue)-\(rawValue)"
    }
}
