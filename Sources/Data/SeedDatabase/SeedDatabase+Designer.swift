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
    func prepareDesigners(on database: Database) async throws {
        try await DesignerModel(
            designer: .peterMoore,
            name: "Peter Moore",
            history: nil,
            silhouettes: [
                .airJordan(.oneHigh),
                .airJordan(.oneLow)
            ],
            brandsWorkedAt: [
                .airJordan
            ],
            on: database
        )
        try await DesignerModel(
            designer: .bruceKilgore,
            name: "Bruce Kilgore",
            history: nil,
            silhouettes: [
                .airJordan(.two),
                .airJordan(.twoLow)
            ],
            brandsWorkedAt: [
                .airJordan
            ],
            on: database
        )
        try await DesignerModel(
            designer: .tinkerHatfield,
            name: "Tinker Hatfield",
            history: nil,
            silhouettes: [
                .airJordan(.three),
                .airJordan(.four),
                .airJordan(.five),
                .airJordan(.six),
                .airJordan(.seven),
                .airJordan(.skySeven),
                .airJordan(.eight),
                .airJordan(.nine),
                .airJordan(.ten),
                .airJordan(.eleven),
                .airJordan(.elevenLowIE),
                .airJordan(.tweleve),
                .airJordan(.thirteen),
                .airJordan(.thirteenLow),
                .airJordan(.fourteen),
                .airJordan(.fourteenLow),
                .airJordan(.fifteen),
                .airJordan(.fifteenLow),
                .airJordan(.elevenLow),
                .airJordan(.nineLow),
                .airJordan(.sixLow)
            ],
            brandsWorkedAt: [
                .airJordan
            ],
            on: database
        )
        try await DesignerModel(
            designer: .wilsonSmithIII,
            name: "Wilson Smith Ⅲ",
            history: nil,
            silhouettes: [
                .airJordan(.sixteen),
                .airJordan(.sixteenLow),
                .airJordan(.seventeen),
                .airJordan(.seventeenLow),
                .airJordan(.seventeenMule),
                .airJordan(.seventeenPlus)
            ],
            brandsWorkedAt: [
                .airJordan
            ],
            on: database
        )
    }
    
    func revertDesigners(on database: Database) async throws {
        try await DesignerModel.query(on: database).delete()
    }
}

// MARK: - DesignerModel

extension DesignerModel {
    enum Designers: Int {
        case peterMoore
        case bruceKilgore
        case tinkerHatfield
        case wilsonSmithIII
    }
}

private extension DesignerModel {
    
    @discardableResult
    convenience init(designer: Designers,
                     name: String,
                     history: String?,
                     silhouettes: [SilhouetteModel.Silhouettes],
                     brandsWorkedAt: [BrandModel.Brands],
                     on database: Database) async throws {
        try await self.init(
            id: designer.rawValue,
            name: name,
            history: history,
            silhouettes: silhouettes.map(\.id),
            brandsWorkedAt: brandsWorkedAt.map(\.rawValue),
            on: database
        )
    }
}
