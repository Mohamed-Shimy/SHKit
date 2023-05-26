//
//  Shape.swift
//  
//
//  Created by Mohamed Shemy on 26/05/2023.
//

import SwiftUI

public extension Shape {
    
    func trim(to: CGFloat, max: CGFloat = 1) -> some Shape {
        trim(from: 0, to: min(to, max))
    }
    
    func trim(to: Float, max: Float = 1) -> some Shape {
        trim(from: 0, to: CGFloat(min(to, max)))
    }
}
