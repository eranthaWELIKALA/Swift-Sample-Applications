//
//  CustomError.swift
//  NetworkClient
//
//  Created by Erantha Welikala on 11/23/21.
//

import Foundation

public struct CustomError: Error, Decodable {
    public var message: String
}
