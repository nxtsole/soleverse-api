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

/// An entity representing a sneaker designer who has designed different sneakers and colorways at a variety of brands.
public struct DesignerEntity {
    
    // MARK: - Properties
    
    /// The object identifier uniquely identifying the designer in the database.
    public let id: Int
    
    /// Returns the name of the designer.
    public let name: String
    
    /// Returns the history of the designer in the sneaker industry and beyond.
    public let history: String?
    
    /// Returns the list of silhouettes that the designer was known for creating or was a part of.
    public let silhouettes: [SilhouetteEntity]
    
    /// Returns the list of sneaker brandhs that the designer has worked at.
    public let brandsWorkedAt: [BrandEntity]
    
    // MARK: - Initializer(s)
    
    public init(id: Int, name: String, history: String?, silhouettes: [SilhouetteEntity], brandsWorkedAt: [BrandEntity]) {
        self.id = id
        self.name = name
        self.history = history
        self.silhouettes = silhouettes
        self.brandsWorkedAt = brandsWorkedAt
    }
}
