//
//  RangeReplaceableCollection.swift
//  
//
//  Created by Mohamed Shemy on 26/05/2023.
//

import Foundation

public extension RangeReplaceableCollection {
        
    func moving(_ index: Index, to: Index) -> Self {
        var elements = self
        elements.move(index, to: to)
        return elements
    }
    
    mutating func move(_ index: Index, to: Index) {
        insert(remove(at: index), at: to)
    }
}

public extension RangeReplaceableCollection {
    
    mutating func removeAll(where condition: (Element) -> Bool) {
        for _ in self {
            remove(where: condition)
        }
    }
    
    mutating func removeAll<T>(where keyPath: KeyPath<Element, T>, _ condition: (T?, T?) -> Bool, _ element: T?) {
        removeAll(where: { condition($0[keyPath: keyPath], element) })
    }
    
    mutating func removeAll<T>(whereNot keyPath: KeyPath<Element, T>, _ condition: (T?, T?) -> Bool, _ element: T?) {
        removeAll(where: { !condition($0[keyPath: keyPath], element) })
    }
    
    mutating func removeAll(where keyPath: KeyPath<Element, Bool>) {
        removeAll(where: { $0[keyPath: keyPath] })
    }
    
    mutating func removeAll<T: Equatable>(where keyPath: KeyPath<Element, T>, equal element: T) {
        removeAll(where: { $0[keyPath: keyPath] == element })
    }
    
    mutating func removeAll(whereIs element: Element) where Element: Equatable {
        removeAll(where: { $0 == element })
    }
    
    mutating func removeAll(whereNot keyPath: KeyPath<Element, Bool>) {
        removeAll(where: { !$0[keyPath: keyPath] })
    }
}
    
public extension RangeReplaceableCollection {
    
    @discardableResult
    mutating func remove(where condition: (Element) -> Bool) -> Element? {
        if let index = firstIndex(where: condition) {
            return remove(at: index)
        }
        return nil
    }
    
    @discardableResult
    mutating func remove<T>(where keyPath: KeyPath<Element, T>, _ condition: (T?, T?) -> Bool, _ element: T?) -> Element? {
        remove(where: { condition($0[keyPath: keyPath], element) })
    }
    
    @discardableResult
    mutating func remove<T>(whereNot keyPath: KeyPath<Element, T>, _ condition: (T?, T?) -> Bool, _ element: T?) -> Element? {
        remove(where: { !condition($0[keyPath: keyPath], element) })
    }
    
    @discardableResult
    mutating func remove(where keyPath: KeyPath<Element, Bool>) -> Element? {
        remove(where: { $0[keyPath: keyPath] })
    }
    
    @discardableResult
    mutating func remove<T: Equatable>(where keyPath: KeyPath<Element, T>, equal element: T) -> Element? {
        remove(where: { $0[keyPath: keyPath] == element })
    }
    
    @discardableResult
    mutating func remove(whereIs element: Element) -> Element? where Element: Equatable {
        remove(where: { $0 == element })
    }
    
    @discardableResult
    mutating func remove(whereNot keyPath: KeyPath<Element, Bool>) -> Element? {
        remove(where: { !$0[keyPath: keyPath] })
    }
}
