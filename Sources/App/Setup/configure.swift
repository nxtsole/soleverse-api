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

import Data
import Vapor

// configures your application
public func configure(_ app: Application) async throws {
    // register middlewares
    middlewares(app)

    try configure(app.databases, app.migrations, app.environment == .testing)
    setupRepositories(app)

    // register routes
    try routes(app)
}
