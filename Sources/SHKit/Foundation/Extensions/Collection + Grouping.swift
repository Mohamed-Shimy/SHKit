//
//  Collection + Grouping.swift
//  
//
//  Created by Mohamed Shemy on 14/07/2023.
//

import Foundation

public extension Collection {
    
    func grouped<Key>(by keyForValue: (Element) -> Key) -> Dictionary<Key, [Element]> where Key: Hashable {
        Dictionary(grouping: self, by: keyForValue)
    }
    
    func grouped<Key>(by keyPath: KeyPath<Element, Key>) -> Dictionary<Key, [Element]> where Key: Hashable {
        grouped(by: { $0[keyPath: keyPath] })
    }
}
