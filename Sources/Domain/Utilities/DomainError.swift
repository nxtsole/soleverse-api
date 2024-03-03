//
//  DomainError.swift
//
//
//  Created by Emanuel Guerrero on 11/13/23.
//

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
