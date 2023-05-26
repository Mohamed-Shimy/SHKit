//
//  Dictionary.swift
//  
//
//  Created by Mohamed Shemy on 26/05/2023.
//

import Foundation

public extension Dictionary {
    
    func hasKey(_ key: Key) -> Bool {
        index(forKey: key) != nil
    }
}

public extension Dictionary {
    
    func map<D>(to type: D.Type) throws -> D where D: Decodable {
        let jsonData = try JSONSerialization.data(withJSONObject: self, options: .prettyPrinted)
        let response = try JSONDecoder().decode(D.self, from: jsonData)
        return response
    }
    
    func mapDecodable<D>() throws -> D where D: Decodable {
        try map(to: D.self)
    }
    
    func mapData() throws -> Data {
        try JSONSerialization.data(withJSONObject: self, options: .prettyPrinted)
    }
}

public extension Dictionary where Key: RawRepresentable {
    
     subscript(rawValue: Key.RawValue) -> Value? {
        if let key = Key(rawValue: rawValue) {
            return self[key]
        }
        return nil
    }
}

public extension Dictionary {
    
    static func + (lhs: [Key: Value], rhs: [Key: Value]) -> [Key: Value] {
        var result = lhs
        rhs.forEach { result[$0] = $1 }
        return result
    }
}
