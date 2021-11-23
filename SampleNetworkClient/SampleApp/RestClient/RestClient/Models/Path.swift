//
//  Path.swift
//  RestClient
//
//  Created by Erantha Welikala on 11/22/21.
//

import Foundation

struct Path {
    private var components: [String]
    
    var absolutePath: String {
        return "/" + components.joined(separator: "/")
    }
    
    init(_ path: String) {
        // Creates the components array by separating the path by slash &
        // Ignoring the empty components
        components = path.components(separatedBy: "/").filter({ !$0.isEmpty})
    }
    
    // mutating modifier is needed since we are modifying a property of a struct using this method
    mutating func append(path: Path) {
        components += path.components
    }
    
    func appending(path: Path) -> Path {
        var copy = self
        copy.append(path: path)
        return copy
    }
    
}
