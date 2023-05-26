//
//  Collection.swift
//  
//
//  Created by Mohamed Shemy on 26/05/2023.
//

import Foundation

public extension Collection {
    
    var isNotEmpty: Bool { !isEmpty }
    
    subscript(safe index: Index) -> Element? {
        indices.contains(index) ? self[index] : nil
    }
}

public extension Collection {
    
    func firstIndex<T>(where keyPath: KeyPath<Element, T>, _ order: (T?, T?) throws -> Bool, _ element: T?) rethrows -> Index? {
        try firstIndex(where: { try order($0[keyPath: keyPath], element) })
    }
    
    func firstIndex<T>(whereNot keyPath: KeyPath<Element, T>, _ condition: (T?, T?) throws -> Bool, _ element: T?) rethrows -> Index? {
        try firstIndex(where: { try !condition($0[keyPath: keyPath], element) })
    }
    
    func firstIndex(where keyPath: KeyPath<Element, Bool>) -> Index? {
        firstIndex(where: { $0[keyPath: keyPath] })
    }
    
    func firstIndex<T: Equatable>(where keyPath: KeyPath<Element, T>, equal element: T) -> Index? {
        firstIndex(where: { $0[keyPath: keyPath] == element })
    }
    
    func firstIndex(whereIs element: Element) -> Index? where Element: Equatable {
        firstIndex(where: { $0 == element })
    }
    
    func firstIndex(whereNot keyPath: KeyPath<Element, Bool>) -> Index? {
        firstIndex(where: { !$0[keyPath: keyPath] })
    }
}

public extension Collection {
    
    func first<T>(where keyPath: KeyPath<Element, T>, _ order: (T?, T?) throws -> Bool, _ element: T?) rethrows -> Element? {
        try first(where: { try order($0[keyPath: keyPath], element) })
    }
    
    func first<T>(whereNot keyPath: KeyPath<Element, T>, _ condition: (T?, T?) throws -> Bool, _ element: T?) rethrows -> Element? {
        try first(where: { try !condition($0[keyPath: keyPath], element) })
    }
    
    func first(where keyPath: KeyPath<Element, Bool>) -> Element? {
        first(where: { $0[keyPath: keyPath] })
    }
    
    func first<T: Equatable>(where keyPath: KeyPath<Element, T>, equal element: T) -> Element? {
        first(where: { $0[keyPath: keyPath] == element })
    }
    
    func first(whereIs element: Element) -> Element? where Element: Equatable {
        first(where: { $0 == element })
    }
    
    func first(whereNot keyPath: KeyPath<Element, Bool>) -> Element? {
        first(where: { !$0[keyPath: keyPath] })
    }
}

public extension Collection {
    
    func sorted<T: Comparable>(by keyPath: KeyPath<Element, T?>, _ condition: (T, T) throws -> Bool) rethrows -> [Element] {
        try sorted {
            guard let first = $0[keyPath: keyPath],
                  let second = $1[keyPath: keyPath]
            else { return false }
            return try condition(first, second)
        }
    }
    
    func sorted<T: Comparable>(by keyPath: KeyPath<Element, T>, _ condition: (T, T) throws -> Bool) rethrows -> [Element] {
        try sorted {
            let first = $0[keyPath: keyPath]
            let second = $1[keyPath: keyPath]
            return try condition(first, second)
        }
    }
}

public extension Collection {
    
    func contains<T>(where keyPath: KeyPath<Element, T>, _ condition: (T?, T?) throws -> Bool, _ element: T?) rethrows -> Bool {
        try contains(where: { try condition($0[keyPath: keyPath], element) })
    }
    
    func contains<T>(whereNot keyPath: KeyPath<Element, T>, _ condition: (T?, T?) throws -> Bool, _ element: T?) rethrows -> Bool {
        try contains(where: { try !condition($0[keyPath: keyPath], element) })
    }
    
    func contains(where keyPath: KeyPath<Element, Bool>) -> Bool {
        contains(where: { $0[keyPath: keyPath] })
    }
    
    func contains<T: Equatable>(where keyPath: KeyPath<Element, T>, equal element: T) -> Bool {
        contains(where: { $0[keyPath: keyPath] == element })
    }
    
    func contains(whereIs element: Element) -> Bool where Element: Equatable {
        contains(where: { $0 == element })
    }
    
    func contains(whereNot keyPath: KeyPath<Element, Bool>) -> Bool {
        contains(where: { !$0[keyPath: keyPath] })
    }
}

public extension Collection {
    
    func filter<T>(where keyPath: KeyPath<Element, T>, _ condition: (T?, T?) throws -> Bool, _ element: T?) rethrows -> [Element] {
        try filter { try condition($0[keyPath: keyPath], element) }
    }
    
    func filter<T>(whereNot keyPath: KeyPath<Element, T>, _ condition: (T?, T?) throws -> Bool, _ element: T?) rethrows -> [Element] {
        try filter { try !condition($0[keyPath: keyPath], element) }
    }
    
    func filter(where keyPath: KeyPath<Element, Bool>) -> [Element] {
        filter({ $0[keyPath: keyPath] })
    }
    
    func filter<T: Equatable>(where keyPath: KeyPath<Element, T>, equal element: T) -> [Element] {
        filter({ $0[keyPath: keyPath] == element })
    }
    
    func filter(whereNot keyPath: KeyPath<Element, Bool>) -> [Element] {
        filter({ !$0[keyPath: keyPath] })
    }
    
    func filter(whereIs element: Element) -> [Element] where Element: Equatable {
        filter({ $0 == element })
    }
}

public extension Collection {
    
    func reduce<Result>(_ initialResult: Result, _ calculate: (Result, Result) throws -> Result, _ keyPath: KeyPath<Element, Result>) rethrows -> Result {
        try self.reduce(initialResult) { partialResult, element in
            try calculate(partialResult, element[keyPath: keyPath])
        }
    }
}

public extension Collection {
    
    func elements(at indices: [Index]) -> [Element] {
        var result: [Element] = []
        for index in indices {
            if let element = self[safe: index] {
                result.append(element)
            }
        }
        return result
    }
}

public extension Collection where Element: Hashable {
    
    func removingDuplicates() -> [Element] {
        var addedDict = [Int: Bool]()
        return filter { addedDict.updateValue(true, forKey: $0.hashValue) == nil }
    }
}
