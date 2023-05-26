//
//  Collection + CaseIterable.swift
//  
//
//  Created by Mohamed Shemy on 26/05/2023.
//

import Foundation

public extension Collection where Element: CaseIterable {
    
    static var all: Element.AllCases { Element.allCases }
}
