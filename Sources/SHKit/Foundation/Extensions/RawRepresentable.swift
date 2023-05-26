//
//  RawRepresentable.swift
//  
//
//  Created by Mohamed Shemy on 26/05/2023.
//

import Foundation

public extension RawRepresentable {
    
    init?(rawValue: Self.RawValue?) {
        guard let rawValue = rawValue else { return nil }
        self.init(rawValue: rawValue)
    }
}

public extension RawRepresentable {
     
    func map<T: RawRepresentable>(to type: T.Type) -> T? where T.RawValue == RawValue {
        T(rawValue: self.rawValue)
    }
    
    func map<T: RawRepresentable>() -> T? where T.RawValue == RawValue {
        self.map(to: T.self)
    }
}

public extension Array where Element: RawRepresentable {
    
    func map<T: RawRepresentable>(to type: T.Type) -> Array<T> where T.RawValue == Element.RawValue {
        self.compactMap { $0.map() }
    }
    
    func map<T: RawRepresentable>() -> Array<T> where T.RawValue == Element.RawValue {
        self.map(to: T.self)
    }
}

public extension Array {
    
    func mapEnum<T>(of type: T.Type) -> Array<T> where T: RawRepresentable, Element == T.RawValue {
        self.compactMap { T(rawValue: $0) }
    }
    
    func mapEnum<T>() -> Array<T> where T: RawRepresentable, Element == T.RawValue {
        self.mapEnum(of: T.self)
    }
}
