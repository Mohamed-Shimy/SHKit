//
//  Collection + IndexPath.swift
//  
//
//  Created by Mohamed Shemy on 26/05/2023.
//

import Foundation

public extension Collection where Element: Collection, Index == Int, Element.Index == Int {
    
    subscript(position: IndexPath) -> Element.Element {
        self[position.section][position.item]
    }
    
    subscript(safe position: IndexPath) -> Element.Element? {
        self[safe: position.section]?[safe: position.item]
    }
}
