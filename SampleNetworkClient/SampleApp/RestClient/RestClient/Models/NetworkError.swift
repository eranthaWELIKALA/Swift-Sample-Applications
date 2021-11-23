//
//  NetworkError.swift
//  RestClient
//
//  Created by Erantha Welikala on 11/22/21.
//

import Foundation

public enum NetworkError<CustomError>: Error {
    case NoInternetConnection
    case Custom(CustomError)
    case UnAuthorized
    case Other
}
