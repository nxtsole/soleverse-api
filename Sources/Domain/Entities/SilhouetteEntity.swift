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

/// An entity representing a sneaker silhouette containing information about the model.
public struct SilhouetteEntity {
    
    // MARK: - Properties
    
    /// The object identifier uniquely identifying the silhouette in the database.
    public let id: Int
    
    /// Returns the name of the silhouette.
    public let name: String
    
    /// Returns the brand that created the silhouette.
    public let brand: BrandEntity
    
    /// Returns the history of the silhouette and how it was created.
    public let history: String?
    
    /// Returns the list of technologies that is used in the silhouette.
    public let technologies: [TechnologyEntity]
    
    // MARK: - Initializer(s)
    
    public init(id: Int, name: String, brand: BrandEntity, history: String?, technologies: [TechnologyEntity]) {
        self.id = id
        self.name = name
        self.brand = brand
        self.history = history
        self.technologies = technologies
    }
}
