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

import Foundation

// MARK: - SneakerEntity

/// An entity representing a sneaker containing information about different things about it.
public struct SneakerEntity {
    
    // MARK: - Properties
    
    /// The object identifier uniquely identifying the sneaker in the database.
    public let id: String
    
    /// Returns the official name of the sneaker given by the brand.
    public let name: String?
    
    /// Returns the history of the sneaker and how it got its origins.
    public let history: String?
    
    /// Returns the nick name of the sneaker that originated in the sneaker community and culture.
    public let nickName: String?
    
    /// Returns the official color way of the sneaker as found on the box label given by the brand.
    public let colorWay: String?
    
    /// Returns the official date that the sneaker released to the public.
    public let releaseDate: Date?
    
    /// Returns the official retail price of the sneaker as found on the box label given by the brand at the time of
    /// the release.
    public let retailPrice: Double?
    
    /// Returns the official SKU uniquely identifying the sneaker within the brand as found on the box label. Different
    /// brands will assign a SKU to a sneaker using different patterns with style and color code combinations. Should
    /// not be used for uniquely identifying a sneaker globally as a SKU can be reused in the wild.
    public let sku: String?
    
    /// Returns the list of designers that designed the sneaker or had a part in it.
    public let designers: [DesignerEntity]
    
    /// Returns the list of collaborators that collaborated on the sneaker or had a part in it.
    public let collaborators: [CollaboratorEntity]
    
    /// Returns the brand that the sneaker is.
    public let brand: BrandEntity
    
    /// Returns the type of silhouette that the sneaker is.
    public let silhouette: SilhouetteEntity?
    
    /// Returns the list of materials that the sneaker is made up of.
    public let materials: [String]
    
    /// Returns the image set containing the list of images to display.
    public let image: ImageEntity?
    
    // MARK: - Initializer(s)
    
    public init(id: String,
                name: String?,
                history: String?,
                nickName: String?,
                colorWay: String?,
                releaseDate: Date?,
                retailPrice: Double?,
                sku: String?,
                designers: [DesignerEntity],
                collaborators: [CollaboratorEntity],
                brand: BrandEntity,
                silhouette: SilhouetteEntity?,
                materials: [String],
                image: ImageEntity?) {
        self.id = id
        self.name = name
        self.history = history
        self.nickName = nickName
        self.colorWay = colorWay
        self.releaseDate = releaseDate
        self.retailPrice = retailPrice
        self.sku = sku
        self.designers = designers
        self.collaborators = collaborators
        self.brand = brand
        self.silhouette = silhouette
        self.materials = materials
        self.image = image
    }
}

// MARK: - ImageEntity

public extension SneakerEntity {
    
    /// An entity representing the set of images related to the sneaker in different positions.
    struct ImageEntity {
        
        // MARK: - Properties
        
        /// Returns the resource location where the image that displays the front of the sneaker is stored.
        public let front: String?
        
        /// Returns the resource location where the image that displays the back of the sneaker is stored.
        public let back: String?
        
        /// Returns the resource location where the image that displays the medial side of the sneaker is stored.
        public let medial: String?
        
        /// Returns the resource location where the image that displays the medial side of the left sneaker is stored.
        public let leftMedial: String?
        
        /// Returns the resource location where the image that displays the medial side of the right sneaker is stored.
        public let rightMedial: String?
        
        /// Returns the resource location where the image that displays the lateral side of the sneaker is stored.
        public let lateral: String?
        
        /// Returns the resource location where the image that displays the lateral side of the left sneaker is stored.
        public let leftLateral: String?
        
        /// Returns the resource location where the image that displays the lateral side of the right sneaker is stored.
        public let rightLateral: String?
        
        // MARK: - Initializer(s)
        
        public init(front: String?,
                    back: String?,
                    medial: String?,
                    leftMedial: String?,
                    rightMedial: String?,
                    lateral: String?, 
                    leftLateral: String?,
                    rightLateral: String?) {
            self.front = front
            self.back = back
            self.medial = medial
            self.leftMedial = leftMedial
            self.rightMedial = rightMedial
            self.lateral = lateral
            self.leftLateral = leftLateral
            self.rightLateral = rightLateral
        }
    }
}
