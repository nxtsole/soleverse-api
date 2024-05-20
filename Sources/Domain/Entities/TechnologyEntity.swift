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

/// An entity representing a sneaker technology used in a silhouette to enhance comfort, performance and durability.
/// Refers to the innovative and advanced features, materials and design.
public struct TechnologyEntity {
    
    // MARK: - Properties
    
    /// The object identifier uniquely identifying the technology in the database.
    public let id: Int
    
    /// Returns the official name of the technology.
    public let name: String
    
    /// Returns the history of the technology and how it was created.
    public let history: String?
    
    /// Returns the brand that invented the technology.
    public let brand: BrandEntity
    
    // MARK: - Initializer(s)
    
    public init(id: Int, name: String, history: String?, brand: BrandEntity) {
        self.id = id
        self.name = name
        self.history = history
        self.brand = brand
    }
}
