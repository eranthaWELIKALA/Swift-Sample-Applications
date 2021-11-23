//
//  User.swift
//  NetworkClientTesting
//
//  Created by Erantha Welikala on 11/23/21.
//

import Foundation

struct User: Codable {
    var id: Int
    var email: String
    var first_name: String
    var last_name: String
    var avatar: String
}

struct Support: Codable {
    var url: String
    var text: String
}

struct UserNetworkResponse: Codable {
    var data: User
    var support: Support
}
