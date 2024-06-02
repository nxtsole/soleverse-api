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

import Fluent
import Vapor

func routes(_ app: Application) throws {
    try app.group("api") { api in
        try api.group("v1") { v1 in
            try v1.register(collection: BrandController())
            try v1.register(collection: TechnologyController())
            try v1.register(collection: SilhouetteController())
            try v1.register(collection: CollaboratorController())
            try v1.register(collection: DesignerController())
            try v1.register(collection: SneakerController())
        }
    }
}
