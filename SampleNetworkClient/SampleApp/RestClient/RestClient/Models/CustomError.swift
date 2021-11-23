//
//  CustomError.swift
//  RestClient
//
//  Created by Erantha Welikala on 11/22/21.
//

import Foundation

public struct CustomError: Error, Decodable {
    var message: String
}
