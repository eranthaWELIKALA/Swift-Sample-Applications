//
//  Result.swift
//  RestClient
//
//  Created by Erantha Welikala on 11/22/21.
//

import Foundation

public enum Result<A, CustomError> {
    case success(A)
    case failure(NetworkError<CustomError>)
}

extension Result {
    init(value: A?, or error: NetworkError<CustomError>) {
        guard let value = value else {
            self = .failure(error)
            return
        }
        
        self = .success(value)
    }
    
    var value: A? {
        guard  case let .success(value) = self else {
            return nil
        }
        return value
    }
    
    var error: NetworkError<CustomError>? {
        guard case let .failure(error) = self else {
            return nil
        }
        return error
    }
}
