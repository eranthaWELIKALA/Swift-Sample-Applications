//
//  Resource.swift
//  NetworkClient
//
//  Created by Erantha Welikala on 11/23/21.
//

import Foundation

public struct Resource<A, CustomError> {
    let path: Path
    let method: RequestMethod
    var headers: HTTPHeaders
    var params: JSON
    let parse: (Data) -> A?
    let parseError: (Data) -> CustomError?
    
    public init(
        path: String,
        method: RequestMethod = .get,
        params: JSON = [:],
        headers: HTTPHeaders = [:],
        parse: @escaping (Data) -> A?,
        parseError: @escaping (Data) -> CustomError?
    ) {
        
        self.path = Path(path)
        self.method = method
        self.headers = headers
        self.params = params
        self.parse = parse
        self.parseError = parseError
        
    }
}

extension Resource where A: Decodable, CustomError: Decodable {
    public init(
        jsonDecorder: JSONDecoder,
        path: String,
        method: RequestMethod = .get,
        params: JSON = [:],
        headers : HTTPHeaders = [:]
    ) {
        self.path = Path(path)
        self.method = method
        self.params = params
        
        var newHeaders = headers
        newHeaders["Accept"] = "application/json"
        newHeaders["Content-Type"] = "application/json"
        self.headers = newHeaders
        
        self.parse = {
            try? jsonDecorder.decode(A.self, from: $0)
        }
        self.parseError = {
            try? jsonDecorder.decode(CustomError.self, from: $0)
        }
    }
}
