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

func migrate(_ migrations: Migrations) {
    migrations.add(BrandModel.Create())
    migrations.add(TechnologyModel.Create())
    migrations.add(SilhouetteModel.Create())
    migrations.add(SilhouetteTechnologyPivotModel.Create())
    migrations.add(CollaboratorModel.Create())
    migrations.add(DesignerModel.Create())
    migrations.add(DesignerBrandPivotModel.Create())
    migrations.add(DesignerSilhouettePivotModel.Create())
    migrations.add(SneakerModel.Create())
    migrations.add(SneakerCollaboratorPivotModel.Create())
    migrations.add(SneakerDesignerPivotModel.Create())
    migrations.add(SeedDatabase())
}
