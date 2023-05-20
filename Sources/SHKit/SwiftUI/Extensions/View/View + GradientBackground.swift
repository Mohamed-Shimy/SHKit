//
//  View + GradientBackground.swift
//  
//
//  Created by Mohamed Shemy on 20/05/2023.
//

import SwiftUI

public extension View {
    
    func linearGradientBackground(_ colors: [Color], start: UnitPoint, end: UnitPoint) -> some View {
        background(LinearGradient(colors: colors, startPoint: start, endPoint: end))
    }
}
