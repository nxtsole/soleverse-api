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
import Fluent

// MARK: - SneakerModel

final class SneakerModel: Model {
    
    // MARK: - Properties
    
    static var schema = "sneakers"
    
    @ID(custom: "id", generatedBy: .user)
    var id: String?
    
    @OptionalField(key: "name")
    var name: String?
    
    @OptionalField(key: "history")
    var history: String?
    
    @OptionalField(key: "nick_name")
    var nickName: String?
    
    @OptionalField(key: "color_way")
    var colorWay: String?
    
    @OptionalField(key: "release_date")
    var releaseDate: Date?
    
    @OptionalField(key: "retail_price")
    var retailPrice: Double?
    
    @OptionalField(key: "sku")
    var sku: String?
    
    @Siblings(through: SneakerDesignerPivotModel.self, from: \.$sneaker, to: \.$designer)
    var designers: [DesignerModel]
    
    @Siblings(through: SneakerCollaboratorPivotModel.self, from: \.$sneaker, to: \.$collaborator)
    var collaborators: [CollaboratorModel]
    
    @Parent(key: "brand")
    var brand: BrandModel
    
    @OptionalParent(key: "silhouette")
    var silhouette: SilhouetteModel?
    
    @OptionalField(key: "materials")
    var materials: String?
    
    @OptionalField(key: "image")
    var imageFields: Image?
    
    // MARK: - Initializer(s)
    
    init() {}
    
    init(id: String,
         name: String?,
         history: String?,
         nickName: String?,
         colorWay: String?,
         releaseDate: Date?,
         retailPrice: Double?,
         sku: String?,
         designers: [DesignerModel.IDValue],
         collaborators: [CollaboratorModel.IDValue],
         brand: BrandModel.IDValue,
         silhouette: SilhouetteModel.IDValue?,
         materials: String?,
         imageFields: Image.Options?,
         on database: Database) async throws {
        self.id = id
        self.name = name
        self.nickName = nickName
        self.colorWay = colorWay
        self.releaseDate = releaseDate
        self.retailPrice = retailPrice
        self.sku = sku
        self.materials = materials
        self.imageFields = imageFields.flatMap { Image(sneakerId: id, options: $0) }
        
        $brand.id = brand
        $silhouette.id = silhouette
        
        try await save(on: database)
        
        if !designers.isEmpty {
            let designerPivots = designers.map { SneakerDesignerPivotModel(sneakerId: id, designerId: $0) }
            
            for designerPivot in designerPivots {
                try await designerPivot.save(on: database)
            }
        }
        
        if !collaborators.isEmpty {
            let collaboratorPivots = collaborators.map { SneakerCollaboratorPivotModel(sneakerId: id, collaboratorId: $0) }
            
            for collaboratorPivot in collaboratorPivots {
                try await collaboratorPivot.save(on: database)
            }
        }
    }
}

// MARK: - Image

extension SneakerModel {
    final class Image: Fields, Codable {
        
        // MARK: - Properties
        
        @OptionalField(key: "front")
        var front: String?
        
        @OptionalField(key: "back")
        var back: String?
        
        @OptionalField(key: "medial")
        var medial: String?
        
        @OptionalField(key: "left_medial")
        var leftMedial: String?
        
        @OptionalField(key: "right_medial")
        var rightMedial: String?
        
        @OptionalField(key: "lateral")
        var lateral: String?
        
        @OptionalField(key: "left_lateral")
        var leftLateral: String?
        
        @OptionalField(key: "right_lateral")
        var rightLateral: String?
        
        // MARK: - Initializer(s)
        
        init() {}
        
        init(front: String? = nil,
             back: String? = nil,
             medial: String? = nil,
             leftMedial: String? = nil,
             rightMedial: String? = nil,
             lateral: String? = nil,
             leftLateral: String? = nil,
             rightLateral: String? = nil) {
            self.front = front
            self.back = back
            self.medial = medial
            self.leftMedial = leftMedial
            self.rightMedial = rightMedial
            self.lateral = lateral
            self.leftLateral = leftLateral
            self.rightLateral = rightLateral
        }
        
        convenience init(sneakerId: String, options: Options) {
            let imagePath = "https://nxtsole.github.io/soleverse-images/sneakers/"
            
            var imageMap: [Options: String] = [:]
            
            if options.contains(.front) {
                imageMap[.front] = "\(imagePath)\(sneakerId)-front.png"
            }
            
            if options.contains(.back) {
                imageMap[.back] = "\(imagePath)\(sneakerId)-back.png"
            }
            
            if options.contains(.medial) {
                imageMap[.medial] = "\(imagePath)\(sneakerId)-medial.png"
            }
            
            if options.contains(.leftMedial) {
                imageMap[.leftMedial] = "\(imagePath)\(sneakerId)-leftMedial.png"
            }
            
            if options.contains(.rightMedial) {
                imageMap[.rightMedial] = "\(imagePath)\(sneakerId)-rightMedial.png"
            }
            
            if options.contains(.lateral) {
                imageMap[.lateral] = "\(imagePath)\(sneakerId)-lateral.png"
            }
            
            if options.contains(.leftLateral) {
                imageMap[.leftLateral] = "\(imagePath)\(sneakerId)-leftLateral.png"
            }
            
            if options.contains(.rightLateral) {
                imageMap[.rightLateral] = "\(imagePath)\(sneakerId)-rightLateral.png"
            }
            
            self.init(
                front: imageMap[.front],
                back: imageMap[.back],
                medial: imageMap[.medial],
                leftMedial: imageMap[.leftMedial],
                rightMedial: imageMap[.rightMedial],
                lateral: imageMap[.lateral],
                leftLateral: imageMap[.leftLateral],
                rightLateral: imageMap[.rightLateral]
            )
        }
    }
}

// MARK: - Options

extension SneakerModel.Image {
    struct Options: OptionSet, Hashable {
        
        // MARK: - Properties
        
        static let front = Self(rawValue: 1 << 0)
        static let back = Self(rawValue: 1 << 1)
        static let medial = Self(rawValue: 1 << 2)
        static let leftMedial = Self(rawValue: 1 << 3)
        static let rightMedial = Self(rawValue: 1 << 4)
        static let lateral = Self(rawValue: 1 << 5)
        static let leftLateral = Self(rawValue: 1 << 6)
        static let rightLateral = Self(rawValue: 1 << 7)
        
        static let all: Self = [.front, .back, .medial, .leftMedial, .rightMedial, .lateral, .leftLateral, .rightLateral]
        
        let rawValue: UInt
    }
}

// MARK: - AsyncMigration

extension SneakerModel {
    
    // MARK: - Create
    
    struct Create: AsyncMigration {
        
        // MARK: - Public Method(s)
        
        func prepare(on database: Database) async throws {
            let brandType = try await database
                .enum("brand_type")
                .read()
            
            try await database
                .schema(SneakerModel.schema)
                .id()
                .field("name", .string)
                .field("history", .string)
                .field("nick_name", .string)
                .field("color_way", .string)
                .field("release_data", .date)
                .field("retail_price", .double)
                .field("sku", .string)
                .field("brand", brandType, .required, .references(BrandModel.schema, "id"))
                .unique(on: "brand")
                .field("silhouette", .int, .references(SilhouetteModel.schema, "id"))
                .unique(on: "silhouette")
                .field("materials", .string)
                .field("image", .dictionary(of: .string))
                .create()
        }
        
        func revert(on database: Database) async throws {
            try await database.schema(SneakerModel.schema).delete()
        }
    }
}

// MARK: - EntityMappable

extension SneakerModel: EntityMappable {
    var toEntity: SneakerEntity {
        get throws {
            guard let id else { throw DomainError.somethingWrong("id is missing in SneakerModel") }
            
            return SneakerEntity(
                id: id,
                name: name,
                history: history,
                nickName: nickName,
                colorWay: colorWay,
                releaseDate: releaseDate,
                retailPrice: retailPrice,
                sku: sku,
                designers: try designers.map { try $0.toEntity },
                collaborators: try collaborators.map { try $0.toEntity },
                brand: try brand.toEntity,
                silhouette: try silhouette.flatMap { try $0.toEntity },
                materials: materials,
                image: imageFields.flatMap {
                    SneakerEntity.ImageEntity(
                        front: $0.front,
                        back: $0.back,
                        medial: $0.medial,
                        leftMedial: $0.leftMedial,
                        rightMedial: $0.rightMedial,
                        lateral: $0.lateral,
                        leftLateral: $0.leftMedial,
                        rightLateral: $0.rightLateral
                    )
                }
            )
        }
    }
}
