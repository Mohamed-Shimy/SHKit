//
//  RoundedCorner.swift
//  
//
//  Created by Mohamed Shemy on 20/05/2023.
//

import SwiftUI

public struct RoundedCorner: Shape {
    
    var radius: CGFloat
    var corners: UIRectCorner = .allCorners
    
    public init(radius: CGFloat, corners: UIRectCorner) {
        self.radius = radius
        self.corners = corners
    }
    
    public func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

public extension View {
    
    func cornerRadius(_ radius: CGFloat, edges: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: edges))
    }
}
