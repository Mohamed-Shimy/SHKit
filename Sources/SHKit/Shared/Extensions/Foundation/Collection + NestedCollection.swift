//
//  Collection + NestedCollection.swift
//  
//
//  Created by Mohamed Shemy on 26/05/2023.
//

import Foundation

public extension Collection where Element: Collection {
    
    func count(at index: Index) -> Int {
        self[index].count
    }
    
    func count(safeAt index: Index) -> Int? {
        self[safe: index]?.count
    }
}
