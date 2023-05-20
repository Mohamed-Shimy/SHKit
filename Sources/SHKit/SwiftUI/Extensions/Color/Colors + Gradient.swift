//
//  Colors + Gradient.swift
//  
//
//  Created by Mohamed Shemy on 20/05/2023.
//

import SwiftUI

public extension Array where Element == Color {
    
    func linearGradient(from: UnitPoint, to: UnitPoint) -> LinearGradient {
        LinearGradient(colors: self, startPoint: from, endPoint: to)
    }
    
    func radialGradient(center: UnitPoint, startRadius: CGFloat, endRadius: CGFloat) -> RadialGradient {
        RadialGradient(colors: self, center: center, startRadius: startRadius, endRadius: endRadius)
    }
    
    func angularGradient(center: UnitPoint, angle: Angle = .degrees(0)) -> AngularGradient {
        AngularGradient(colors: self, center: center, angle: angle)
    }
    
    func angularGradient(center: UnitPoint, startAngle: Angle, endAngle: Angle) -> AngularGradient {
        AngularGradient(colors: self, center: center, startAngle: startAngle, endAngle: endAngle)
    }
}
