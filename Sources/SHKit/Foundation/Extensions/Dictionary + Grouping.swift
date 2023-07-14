//
//  Dictionary + Grouping.swift
//  
//
//  Created by Mohamed Shemy on 14/07/2023.
//

import Foundation

public extension Dictionary where Value: Collection {
    
    func grouped<K>(by keyForValue: (Value.Element) -> K) -> Dictionary<Key, Dictionary<K, [Value.Element]>> where K: Hashable {
        self.reduce([:]) { (partialResult, arg) in
            var partialResult = partialResult
            partialResult[arg.key] = arg.value.grouped(by: keyForValue)
            return partialResult
        }
    }
    
    func grouped<K>(by keyPath: KeyPath<Value.Element, K>) -> Dictionary<Key, Dictionary<K, [Value.Element]>> where K: Hashable {
        grouped(by: { $0[keyPath: keyPath] })
    }
}
