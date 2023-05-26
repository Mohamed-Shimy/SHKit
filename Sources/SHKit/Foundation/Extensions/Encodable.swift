//
//  Encodable.swift
//  
//
//  Created by Mohamed Shemy on 26/05/2023.
//

import Foundation

public extension Encodable {
    
    func mapDictionary() throws -> [String: Any]? {
        let data = try JSONEncoder().encode(self)
        return try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed) as? [String: Any]
    }
}
