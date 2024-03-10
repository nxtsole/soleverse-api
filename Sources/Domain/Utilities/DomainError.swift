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

public enum DomainError: LocalizedError {
    case validation(String)
    case somethingWrong(String)
    
    public var errorDescription: String? {
        switch self {
        case let .validation(error):
            return error
        case let .somethingWrong(error):
            return error
        }
    }
}

extension DomainError: Equatable {}
