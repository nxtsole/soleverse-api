//
//  EntityMappable.swift
//
//
//  Created by Emanuel Guerrero on 11/7/23.
//

import Foundation

public protocol EntityMappable {
    associatedtype Entity
    
    var toEntity: Entity { get throws }
    
    init(entity: Entity)
}
