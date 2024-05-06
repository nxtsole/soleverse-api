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

/// An entity representing a collaborator that collaborated with a sneaker brand to create a sneaker or a colorway on a
/// sneaker.
public struct CollaboratorEntity {
    
    // MARK: - Properties
    
    /// The object identifier uniquely identifying the collaborator in the database.
    public let id: Int
    
    /// Returns the name of the collaborator.
    public let name: String
    
    /// Returns the history of the collaborator and what types of sneakers they have worked on.
    public let history: String?
    
    // MARK: - Initializer(s)
    
    public init(id: Int, name: String, history: String?) {
        self.id = id
        self.name = name
        self.history = history
    }
}
