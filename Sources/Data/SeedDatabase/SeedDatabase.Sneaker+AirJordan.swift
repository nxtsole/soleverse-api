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
import Foundation

extension SeedDatabase {
    func prepareAirJordanSneakers(on database: Database) async throws {
        try await SneakerModel(
            id: 0,
            name: "Air Jordan 1 High 'Chicago' 1985",
            history: "Conceptualized by Peter Moore, the Air Jordan 1 High 'Chicago' 1985 shoe changed the way people regarded sneakers forever. This first edition honors the Chicago Bulls team colors in a full-grain leather build complete with sleek Swooshes, Wings branding and a molded collar. Nike Air cushioning is embedded in the midsole, while a modified herringbone outsole provides traction.",
            nickName: "Chicago",
            colorWay: "White/Black-Varsity Red",
            releaseDate: DateComponents(calendar: .current, year: 1985, month: 9, day: 14).date,
            retailPrice: nil,
            sku: "4280",
            designers: [.peterMoore],
            collaborators: [],
            brand: .airJordan,
            silhouette: .airJordan(.oneHigh),
            materials: "Leather",
            imageFields: [.lateral, .back, .medial],
            on: database
        )
        try await SneakerModel(
            id: 1,
            name: "Air Jordan 1 High 'Bred' 1985",
            history: "This ‘Bred’ colorway originally released in April 1985 during Michael Jordan’s rookie season with the Chicago Bulls, soon becoming the focal point of Nike’s iconic ‘Banned’ marketing campaign. Although it didn’t actually result in a $5,000-per-game fine, the black and red colorway became iconic. The white midsole houses Nike Air for cushioning, and the colorway is forever synonymous with MJ and Chicago.",
            nickName: "Bred",
            colorWay: "Black/Red",
            releaseDate: DateComponents(calendar: .current, year: 1985, month: 9, day: 14).date,
            retailPrice: nil,
            sku: "4281",
            designers: [.peterMoore],
            collaborators: [],
            brand: .airJordan,
            silhouette: .airJordan(.oneHigh),
            materials: "Leather",
            imageFields: [.lateral, .back, .medial],
            on: database
        )
        try await SneakerModel(
            id: 2,
            name: "Air Jordan 1 High 'Metallic Burgundy' 1985",
            history: nil,
            nickName: "Metallic Burgundy",
            colorWay: "White/Metallic Burgundy",
            releaseDate: DateComponents(calendar: .current, year: 1985, month: 10, day: 1).date,
            retailPrice: nil,
            sku: nil,
            designers: [.peterMoore],
            collaborators: [],
            brand: .airJordan,
            silhouette: .airJordan(.oneHigh),
            materials: "Leather",
            imageFields: [.lateral],
            on: database
        )
        try await SneakerModel(
            id: 3,
            name: "Air Jordan 1 High 'UNC' 1985",
            history: nil,
            nickName: "UNC",
            colorWay: "White/Dark Powder Blue",
            releaseDate: DateComponents(calendar: .current, year: 1985, month: 9, day: 14).date,
            retailPrice: nil,
            sku: "4297",
            designers: [.peterMoore],
            collaborators: [],
            brand: .airJordan,
            silhouette: .airJordan(.oneHigh),
            materials: "Leather",
            imageFields: [.lateral],
            on: database
        )
        try await SneakerModel(
            id: 4,
            name: "Air Jordan 1 High 'Metallic Purple' 1985",
            history: nil,
            nickName: "UNC",
            colorWay: "White/Metallic Purple",
            releaseDate: DateComponents(calendar: .current, year: 1985, month: 10, day: 1).date,
            retailPrice: nil,
            sku: nil,
            designers: [.peterMoore],
            collaborators: [],
            brand: .airJordan,
            silhouette: .airJordan(.oneHigh),
            materials: "Leather",
            imageFields: [.lateral],
            on: database
        )
        try await SneakerModel(
            id: 5,
            name: "Air Jordan 1 High 'White Black' 1985",
            history: nil,
            nickName: "White Black",
            colorWay: "White/Black",
            releaseDate: DateComponents(calendar: .current, year: 1985, month: 9, day: 1).date,
            retailPrice: nil,
            sku: "4298",
            designers: [.peterMoore],
            collaborators: [],
            brand: .airJordan,
            silhouette: .airJordan(.oneHigh),
            materials: "Leather",
            imageFields: [.lateral],
            on: database
        )
        try await SneakerModel(
            id: 6,
            name: "Air Jordan 1 High 'Dark Royal Blue' 1985",
            history: nil,
            nickName: "Dark Royal Blue",
            colorWay: "White/Dark Royal Blue",
            releaseDate: DateComponents(calendar: .current, year: 1985, month: 9, day: 1).date,
            retailPrice: nil,
            sku: "4296",
            designers: [.peterMoore],
            collaborators: [],
            brand: .airJordan,
            silhouette: .airJordan(.oneHigh),
            materials: "Leather",
            imageFields: [.lateral],
            on: database
        )
        try await SneakerModel(
            id: 7,
            name: "Air Jordan 1 High 'Metallic Green' 1985",
            history: nil,
            nickName: "Metallic Green",
            colorWay: "White/Metallic Green",
            releaseDate: DateComponents(calendar: .current, year: 1985, month: 10, day: 1).date,
            retailPrice: nil,
            sku: nil,
            designers: [.peterMoore],
            collaborators: [],
            brand: .airJordan,
            silhouette: .airJordan(.oneHigh),
            materials: "Leather",
            imageFields: [.lateral],
            on: database
        )
        try await SneakerModel(
            id: 8,
            name: "Air Jordan 1 Low 'White Metallic Blue' 1985",
            history: nil,
            nickName: "White Metallic Blue",
            colorWay: "White/Metallic Blue",
            releaseDate: DateComponents(calendar: .current, year: 1985, month: 10, day: 1).date,
            retailPrice: nil,
            sku: "4289",
            designers: [.peterMoore],
            collaborators: [],
            brand: .airJordan,
            silhouette: .airJordan(.oneLow),
            materials: "Leather",
            imageFields: [.lateral],
            on: database
        )
        try await SneakerModel(
            id: 9,
            name: "Air Jordan 1 Low 'White Natural' 1985",
            history: nil,
            nickName: "White Natural",
            colorWay: "White/Natural",
            releaseDate: DateComponents(calendar: .current, year: 1985, month: 10, day: 1).date,
            retailPrice: nil,
            sku: "4285",
            designers: [.peterMoore],
            collaborators: [],
            brand: .airJordan,
            silhouette: .airJordan(.oneLow),
            materials: "Leather",
            imageFields: [.lateral],
            on: database
        )
        try await SneakerModel(
            id: 10,
            name: "Air Jordan 1 High 'Metallic Orange' 1985",
            history: nil,
            nickName: "Metallic Orange",
            colorWay: "White/Metallic Orange",
            releaseDate: DateComponents(calendar: .current, year: 1985, month: 10, day: 1).date,
            retailPrice: nil,
            sku: nil,
            designers: [.peterMoore],
            collaborators: [],
            brand: .airJordan,
            silhouette: .airJordan(.oneHigh),
            materials: "Leather",
            imageFields: [.lateral],
            on: database
        )
        try await SneakerModel(
            id: 11,
            name: "Air Jordan 1 High 'Shadow' 1985",
            history: nil,
            nickName: "Shadow",
            colorWay: "Black/Soft Grey",
            releaseDate: DateComponents(calendar: .current, year: 1985, month: 9, day: 1).date,
            retailPrice: nil,
            sku: "4283",
            designers: [.peterMoore],
            collaborators: [],
            brand: .airJordan,
            silhouette: .airJordan(.oneHigh),
            materials: "Leather",
            imageFields: [.lateral],
            on: database
        )
        try await SneakerModel(
            id: 12,
            name: "Air Jordan 1 High 'Metallic Red' 1985",
            history: nil,
            nickName: "Metallic Red",
            colorWay: "White/Metallic Red",
            releaseDate: DateComponents(calendar: .current, year: 1985, month: 10, day: 1).date,
            retailPrice: nil,
            sku: nil,
            designers: [.peterMoore],
            collaborators: [],
            brand: .airJordan,
            silhouette: .airJordan(.oneHigh),
            materials: "Leather",
            imageFields: [.lateral],
            on: database
        )
        try await SneakerModel(
            id: 13,
            name: "Air Jordan 1 High OG 'Black Toe' 1985",
            history: nil,
            nickName: "Black Toe",
            colorWay: "Black/Varsity Red/White",
            releaseDate: DateComponents(calendar: .current, year: 1985, month: 1, day: 1).date,
            retailPrice: nil,
            sku: "451012ST",
            designers: [.peterMoore],
            collaborators: [],
            brand: .airJordan,
            silhouette: .airJordan(.oneHigh),
            materials: "Leather",
            imageFields: [.lateral],
            on: database
        )
        try await SneakerModel(
            id: 14,
            name: "Air Jordan 1 High 'Metallic Black' 1985",
            history: nil,
            nickName: "Metallic Black",
            colorWay: "White/Black",
            releaseDate: DateComponents(calendar: .current, year: 1985, month: 10, day: 1).date,
            retailPrice: nil,
            sku: "4287",
            designers: [.peterMoore],
            collaborators: [],
            brand: .airJordan,
            silhouette: .airJordan(.oneHigh),
            materials: "Leather",
            imageFields: [.lateral],
            on: database
        )
        try await SneakerModel(
            id: 15,
            name: "Air Jordan 1 High 'Royal' 1985",
            history: "Better known as the Air Jordan 1 ‘Royal,’ this black and blue version of Michael Jordan’s first signature shoe was one in a handful of original colorways released in 1985. The iconic color combination has made retro returns in 2001, 2013, in 2015 as a low-top, and again in 2017. It blends black and Royal Blue leather atop a white full-length midsole and blue rubber outsole.",
            nickName: "Royal",
            colorWay: "Black/Royal Blue",
            releaseDate: DateComponents(calendar: .current, year: 1985, month: 9, day: 14).date,
            retailPrice: nil,
            sku: "4282",
            designers: [.peterMoore],
            collaborators: [],
            brand: .airJordan,
            silhouette: .airJordan(.oneHigh),
            materials: "Leather",
            imageFields: [.lateral],
            on: database
        )
        try await SneakerModel(
            id: 16,
            name: "Air Jordan 1 High 'Natural Grey' 1985",
            history: "One of the Air Jordan 1’s original colorways from 1985, this ‘Natural Grey’ combination remains a sought-after classic. The design features a white leather upper offset by grey Swoosh logos, Air Jordan branding, and a contrasting ankle collar. The desaturated look continues underfoot with a white midsole and grey rubber outsole.",
            nickName: "Natural Grey",
            colorWay: "White/Natural Grey",
            releaseDate: DateComponents(calendar: .current, year: 1985, month: 9, day: 14).date,
            retailPrice: nil,
            sku: "4295",
            designers: [.peterMoore],
            collaborators: [],
            brand: .airJordan,
            silhouette: .airJordan(.oneHigh),
            materials: "Leather",
            imageFields: [.lateral, .medial, .back],
            on: database
        )
        try await SneakerModel(
            id: 17,
            name: "Sky Jordan 1 OG High 'Chicago' 1985",
            history: nil,
            nickName: "Chicago",
            colorWay: "White/Black/Red",
            releaseDate: DateComponents(calendar: .current, year: 1985, month: 10, day: 1).date,
            retailPrice: nil,
            sku: "8433",
            designers: [],
            collaborators: [],
            brand: .airJordan,
            silhouette: .airJordan(.skyOneHigh),
            materials: "Leather",
            imageFields: [.lateral],
            on: database
        )
        try await SneakerModel(
            id: 18,
            name: "Air Jordan 1 High GS 'Chicago' 1985",
            history: nil,
            nickName: "Chicago",
            colorWay: "White/Red/Black",
            releaseDate: DateComponents(calendar: .current, year: 1985, month: 1, day: 1).date,
            retailPrice: nil,
            sku: "8435",
            designers: [.peterMoore],
            collaborators: [],
            brand: .airJordan,
            silhouette: .airJordan(.oneHigh),
            materials: "Leather",
            imageFields: [.lateral],
            on: database
        )
        try await SneakerModel(
            id: 19,
            name: "Air Jordan 2 OG 'Chicago' 1986",
            history: nil,
            nickName: "Chicago",
            colorWay: "White/Black/Varsity Red",
            releaseDate: DateComponents(calendar: .current, year: 1986, month: 1, day: 1).date,
            retailPrice: nil,
            sku: "4360",
            designers: [.bruceKilgore],
            collaborators: [],
            brand: .airJordan,
            silhouette: .airJordan(.two),
            materials: "Leather",
            imageFields: [.lateral],
            on: database
        )
        try await SneakerModel(
            id: 20,
            name: "Air Jordan 2 OG 'White Red' 1986",
            history: nil,
            nickName: "White Red",
            colorWay: "White/Red",
            releaseDate: DateComponents(calendar: .current, year: 1986, month: 1, day: 1).date,
            retailPrice: nil,
            sku: "4361",
            designers: [.bruceKilgore],
            collaborators: [],
            brand: .airJordan,
            silhouette: .airJordan(.two),
            materials: "Leather",
            imageFields: [.lateral],
            on: database
        )
        try await SneakerModel(
            id: 21,
            name: "Air Jordan 2 Low OG 'Chicago' 1986",
            history: nil,
            nickName: "Chicago",
            colorWay: "White/Black",
            releaseDate: DateComponents(calendar: .current, year: 1986, month: 1, day: 1).date,
            retailPrice: nil,
            sku: "4115",
            designers: [.bruceKilgore],
            collaborators: [],
            brand: .airJordan,
            silhouette: .airJordan(.twoLow),
            materials: "Leather",
            imageFields: [.lateral],
            on: database
        )
        try await SneakerModel(
            id: 22,
            name: "Air Jordan 2 Low OG 'White Red' 1986",
            history: nil,
            nickName: "White Red",
            colorWay: "White/Red",
            releaseDate: DateComponents(calendar: .current, year: 1986, month: 1, day: 2).date,
            retailPrice: nil,
            sku: "4116",
            designers: [.bruceKilgore],
            collaborators: [],
            brand: .airJordan,
            silhouette: .airJordan(.twoLow),
            materials: "Leather",
            imageFields: [.lateral],
            on: database
        )
    }
}
