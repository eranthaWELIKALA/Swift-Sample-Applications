//
//  NetworkError.swift
//  NetworkClient
//
//  Created by Erantha Welikala on 11/23/21.
//

import Foundation

public enum NetworkError<CustomError>: Error {
    case NoInternetConnection
    case Custom(CustomError)
    case UnAuthorized
    case ResponseTypeMismatched
    case Other
}
