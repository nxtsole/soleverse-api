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

/// An entity representing a sneaker brand that created different types of silhouettes.
public struct BrandEntity {
    
    // MARK: - Properties
    
    /// The object identifier uniquely identifying the brand in the database.
    public let id: Int
    
    /// Returns the name of the brand.
    public let name: String
    
    /// Returns the history of the brand.
    public let history: String?
    
    // MARK: - Initializer(s)
    
    public init(id: Int, name: String, history: String?) {
        self.id = id
        self.name = name
        self.history = history
    }
}
