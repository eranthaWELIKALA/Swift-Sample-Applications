//
//  Path.swift
//  NetworkClient
//
//  Created by Erantha Welikala on 11/23/21.
//

import Foundation

public struct Path {
    private var components: [String]
    
    public var absolutePath: String {
        return "/" + components.joined(separator: "/")
    }
    
    public init(_ path: String) {
        // Creates the components array by separating the path by slash &
        // Ignoring the empty components
        components = path.components(separatedBy: "/").filter({ !$0.isEmpty})
    }
    
    // mutating modifier is needed since we are modifying a property of a struct using this method
    public mutating func append(path: Path) {
        components += path.components
    }
    
    public func appending(path: Path) -> Path {
        var copy = self
        copy.append(path: path)
        return copy
    }
    
}
