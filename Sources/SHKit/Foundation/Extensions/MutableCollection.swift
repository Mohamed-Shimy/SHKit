//
//  MutableCollection.swift
//  
//
//  Created by Mohamed Shemy on 26/05/2023.
//

import Foundation

public extension MutableCollection where Self: RandomAccessCollection {
    
    subscript(safe index: Index) -> Element? {
        get { indices.contains(index) ? self[index] : nil }
        set {
            guard let newValue = newValue, indices.contains(index) else { return }
            self[index] = newValue
        }
    }
    
    mutating func sort<T>(by keyPath: KeyPath<Element, T>, by order: (T, T) throws -> Bool) rethrows {
        try sort {  try order($0[keyPath: keyPath], $1[keyPath: keyPath]) }
    }
}
