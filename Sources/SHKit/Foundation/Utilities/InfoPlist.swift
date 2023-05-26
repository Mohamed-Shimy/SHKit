//
//  InfoPlist.swift
//  
//
//  Created by Mohamed Shemy on 26/05/2023.
//

import Foundation

public struct InfoPlist {
    
    internal let bundle: Bundle
    
    public init(_ bundle: Bundle) {
        self.bundle = bundle
    }
    
    public func value(for key: Key) -> Any? {
        bundle.object(forInfoDictionaryKey: key.name)
    }
    
    public func string(for key: Key) -> String? {
        value(for: key) as? String
    }
    
    public func int(for key: Key) -> Int? {
        value(for: key) as? Int
    }
    
    public func double(for key: Key) -> Double? {
        value(for: key) as? Double
    }
    
    public func array<T>(for key: Key) -> [T] {
        value(for: key) as? [T] ?? []
    }
    
    public func dictionary<K, V>(for key: Key) -> [K: V] {
        value(for: key) as? [K: V] ?? [:]
    }
}

public extension InfoPlist {
    
    static let main = InfoPlist(.main)
}

public extension InfoPlist {
    
    struct Key {
        let name: String
        
        public init(_ name: String) {
            self.name = name
        }
    }
}

extension InfoPlist.Key: ExpressibleByStringLiteral {
    
    public init(stringLiteral value: StringLiteralType) {
        self.init(value)
    }
    
    public init(unicodeScalarLiteral value: String) {
        self.init(value)
    }
    
    public init(extendedGraphemeClusterLiteral value: String) {
        self.init(value)
    }
}

public extension InfoPlist.Key {
    
    static let bundleDevelopmentRegion: Self = "CFBundleDevelopmentRegion"
    static let bundleShortVersion: Self = "CFBundleShortVersionString"
    static let bundleExecutable: Self = "CFBundleExecutable"
    static let bundleIdentifier: Self = "CFBundleIdentifier"
    static let bundleName: Self = "CFBundleName"
    static let bundleVersion: Self = "CFBundleVersion"
}
