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

public struct CreateTodoEntity {
    
    // MARK: - Properties
    
    public let title: String
    
    // MARK: - Initializer(s)
    
    public init(title: String) {
        self.title = title
    }
}
