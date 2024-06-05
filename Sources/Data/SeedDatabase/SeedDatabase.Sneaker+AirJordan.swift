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
        try await SneakerModel(
            id: 23,
            name: "Air Jordan 3 OG 'White Cement' 1988",
            history: "The Air Jordan 3 was originally released in 1988 following Michael Jordan’s famous win of the NBA Slam Dunk Contest from the free throw line. It is the first Air Jordan by legendary designer Tinker Hatfield and the first to drop the Wings logo for the iconic Jumpman logo. Additionally, the design is the first Air Jordan to feature visible Air units and elephant print on the upper. The white and Grey Cement colorway is the first of four classic colorways and the colorway of choice for Jordan’s 1988 Dunk Contest.",
            nickName: "White Cement",
            colorWay: "White/Cement Grey",
            releaseDate: DateComponents(calendar: .current, year: 1988, month: 2, day: 1).date,
            retailPrice: nil,
            sku: "4365",
            designers: [.tinkerHatfield],
            collaborators: [],
            brand: .airJordan,
            silhouette: .airJordan(.three),
            materials: "Leather",
            imageFields: [.lateral],
            on: database
        )
        try await SneakerModel(
            id: 24,
            name: "Air Jordan 3 OG 'Fire Red' 1988",
            history: "Originally released in 1988, the Air Jordan 3 OG ‘Fire Red’ features a white leather upper with Fire Red accents on the eyelets, collar, and midsole. The sneaker also boasts the iconic elephant print on the toe cap and heel and a partially encapsulated Air unit in the midsole. Matching well with the Chicago Bulls uniforms, Michael Jordan wore them for a bulk of the 1988 NBA season.",
            nickName: "Fire Red",
            colorWay: "White/Fire Red",
            releaseDate: DateComponents(calendar: .current, year: 1988, month: 6, day: 1).date,
            retailPrice: nil,
            sku: "4367",
            designers: [.tinkerHatfield],
            collaborators: [],
            brand: .airJordan,
            silhouette: .airJordan(.three),
            materials: "Leather",
            imageFields: [.lateral],
            on: database
        )
        try await SneakerModel(
            id: 25,
            name: "Air Jordan 3 OG 'Black Cement' 1988",
            history: "The Air Jordan 3 kicked off Tinker Hatfield’s legendary partnership with Michael Jordan and his signature line. The silhouette, showcased here in the OG black colorway, debuted the now-iconic elephant print, as well as the brand’s Jumpman logo. The sculpted polyurethane midsole introduced another first to the Jordan line, a visible Air Sole unit borrowed from Tinker’s groundbreaking Air Max 1 from the previous year.",
            nickName: "Black Cement",
            colorWay: "Black/Cement Grey",
            releaseDate: DateComponents(calendar: .current, year: 1988, month: 2, day: 1).date,
            retailPrice: nil,
            sku: "4366",
            designers: [.tinkerHatfield],
            collaborators: [],
            brand: .airJordan,
            silhouette: .airJordan(.three),
            materials: "Leather",
            imageFields: [.lateral],
            on: database
        )
        try await SneakerModel(
            id: 26,
            name: "Air Jordan 3 OG 'True Blue' 1988",
            history: "Released in 1988, the Air Jordan 3 OG ‘True Blue’ colorway was the first Air Jordan to stray from the Chicago Bulls colors of white, black and red. The design is defined by a white tumbled leather upper, Cement Grey detailing, and True Blue accents as well as an original Fire Red inner tongue and insole.",
            nickName: "True Blue",
            colorWay: "White/Cement Grey/True Blue",
            releaseDate: DateComponents(calendar: .current, year: 1988, month: 6, day: 1).date,
            retailPrice: nil,
            sku: "4368",
            designers: [.tinkerHatfield],
            collaborators: [],
            brand: .airJordan,
            silhouette: .airJordan(.three),
            materials: "Leather",
            imageFields: [.lateral],
            on: database
        )
        try await SneakerModel(
            id: 27,
            name: "Air Jordan 4 OG 'White Cement' 1989",
            history: "The ‘White Cement’ version of the Air Jordan OG 4 was one of four original colorways released in 1989 and the first to make an appearance in a feature film, Spike Lee’s “Do The Right Thing.” It features a crisp white leather-based upper with matching over-molded mesh and a style-defining cement pattern on the heel, technical strap, and midsole. Red Jumpman branding adds a pop of color to the tongue while a black Nike Air logo adorns the heel in black.",
            nickName: "White Cement",
            colorWay: "White/Black",
            releaseDate: DateComponents(calendar: .current, year: 1989, month: 1, day: 1).date,
            retailPrice: nil,
            sku: "4362",
            designers: [.tinkerHatfield],
            collaborators: [],
            brand: .airJordan,
            silhouette: .airJordan(.four),
            materials: "Leather",
            imageFields: [.lateral],
            on: database
        )
        try await SneakerModel(
            id: 28,
            name: "Air Jordan 4 OG 'Military Blue' 1989",
            history: "The Air Jordan 4 OG transcended the game of basketball to make a significant impact on pop culture when it first released in 1989. This 'Military Blue' color works a non-traditional palette on the leather, nubuck and mesh upper, with bold eyestays and a synthetic mudguard creating contrast. An iconic Jumpman on the tongue and Nike Air heel branding are hallmarks of the AJ4 design.",
            nickName: "Military Blue",
            colorWay: "Off White/Military Blue",
            releaseDate: DateComponents(calendar: .current, year: 1989, month: 6, day: 1).date,
            retailPrice: nil,
            sku: "4369",
            designers: [.tinkerHatfield],
            collaborators: [],
            brand: .airJordan,
            silhouette: .airJordan(.four),
            materials: "Leather",
            imageFields: [.lateral],
            on: database
        )
        try await SneakerModel(
            id: 29,
            name: "Air Jordan 4 OG 'Fire Red' 1989",
            history: "This is the original Air Jordan 4 ‘Fire Red,’ one of four OG colorways released in 1989. Designed by Nike legend Tinker Hatfield, the shoe sports a white leather build, accented with contrasting pops of black and Fire Red throughout the upper and midsole. Distinguishing details include netting on the quarter panels, molded structural ‘wings,’ Nike Air branding on the heel panel and the visible Nike Air unit in the midsole.",
            nickName: "Fire Red",
            colorWay: "White/Fire Red/Black",
            releaseDate: DateComponents(calendar: .current, year: 1989, month: 2, day: 1).date,
            retailPrice: nil,
            sku: "4364",
            designers: [.tinkerHatfield],
            collaborators: [],
            brand: .airJordan,
            silhouette: .airJordan(.four),
            materials: "Leather",
            imageFields: [.lateral, .medial, .back],
            on: database
        )
        try await SneakerModel(
            id: 30,
            name: "Air Jordan 4 OG 'Bred' 1989",
            history: "In the 1989 NBA Playoffs, Michael Jordan wowed the world by hitting ‘The Shot’, winning a game against the Cleveland Cavaliers on a buzzer beater. On his feet was the Air Jordan 4 OG. The sneaker features a black nubuck upper with mesh panels on the sides and forefoot for breathability. The sneaker also sports Cement Grey accents on the lacing system and on the inner lining of the shoe. As is tradition, the mid top sports a partially encapsulated Air Max unit in the midsole for responsive and lightweight cushioning.",
            nickName: "Bred",
            colorWay: "Black/Cement Grey",
            releaseDate: DateComponents(calendar: .current, year: 1989, month: 2, day: 1).date,
            retailPrice: nil,
            sku: "4363",
            designers: [.tinkerHatfield],
            collaborators: [],
            brand: .airJordan,
            silhouette: .airJordan(.four),
            materials: "Nubuck",
            imageFields: [.lateral, .medial, .back],
            on: database
        )
    }
}
