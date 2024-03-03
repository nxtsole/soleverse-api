//
//  CreateTodoRequest.swift
//
//
//  Created by Emanuel Guerrero on 11/7/23.
//

import Domain
import Vapor

// MARK: - CreateTodoRequest

struct CreateTodoRequest: Content {
    let title: String
}

// MARK: - EntityMappable

extension CreateTodoRequest: EntityMappable {
    var toEntity: CreateTodoEntity { .init(title: title) }
    
    init(entity: CreateTodoEntity) {
        self.init(title: entity.title)
    }
}
