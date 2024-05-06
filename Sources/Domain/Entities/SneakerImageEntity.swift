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

/// An entity representing the set of images related to a sneaker in different positions.
public struct SneakerImageEntity {
    
    // MARK: - Properties
    
    /// The object identifier uniquely identifying the sneaker image. Utilizes the same PK ID as the `SneakerEntity`
    /// that it is tied to.
    public let id: Int
    
    /// Returns the resource location where the image that displays the front of the sneaker is stored.
    public let front: URL?
    
    /// Returns the resource location where the image that displays the back of the sneaker is stored.
    public let back: URL?
    
    /// Returns the resource location where the image that displays the medial side of the sneaker is stored.
    public let medial: URL?
    
    /// Returns the resource location where the image that displays the medial side of the left sneaker is stored.
    public let leftMedial: URL?
    
    /// Returns the resource location where the image that displays the medial side of the right sneaker is stored.
    public let rightMedial: URL?
    
    /// Returns the resource location where the image that displays the lateral side of the sneaker is stored.
    public let lateral: URL?
    
    /// Returns the resource location where the image that displays the lateral side of the left sneaker is stored.
    public let leftLateral: URL?
    
    /// Returns the resource location where the image that displays the lateral side of the right sneaker is stored.
    public let rightLateral: URL?
    
    // MARK: - Initializer(s)
    
    public init(id: Int, front: URL?, back: URL?, medial: URL?, leftMedial: URL?, rightMedial: URL?, lateral: URL?, leftLateral: URL?, rightLateral: URL?) {
        self.id = id
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
