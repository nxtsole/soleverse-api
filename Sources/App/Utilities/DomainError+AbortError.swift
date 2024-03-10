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
import Vapor

extension DomainError: AbortError {
    public var status: HTTPResponseStatus {
        switch self {
        case .validation:
            return .badRequest
        case .somethingWrong:
            return .internalServerError
        }
    }
    
    public var reason: String {
        switch self {
        case let .validation(error):
            return error
        case let .somethingWrong(error):
            return error
        }
    }
}
