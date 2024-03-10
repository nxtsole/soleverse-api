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

public protocol TodoRepository: Repository {
    func create(_ entity: CreateTodoEntity) async throws -> TodoEntity
    func read() async throws -> [TodoEntity]
    func read(id: UUID) async throws -> TodoEntity
    func delete(id: UUID) async throws
}
