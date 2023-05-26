//
//  Path.swift
//  
//
//  Created by Mohamed Shemy on 26/05/2023.
//

import SwiftUI

public extension Path {
    
    mutating func polygon(at points: [CGPoint], isClosed: Bool = true) {
        guard let firstPoint = points.first else { return }
        move(to: firstPoint)
        for point in points.suffix(from: 1) {
            addLine(to: point)
        }
        if isClosed {
            closeSubpath()
        }
    }
    
    mutating func hexagon(at location: CGPoint, size: Int, isClosed: Bool = true) {
        let points = [
            CGPoint(x: Int(location.x) + (size / 2), y: Int(location.y)),
            CGPoint(x: Int(location.x) + size, y: Int(location.y) + (size/4)),
            CGPoint(x: Int(location.x) + size, y: Int(location.y) + (3*size/4)),
            CGPoint(x: Int(location.x) + (size/2), y: Int(location.y) + size),
            CGPoint(x: Int(location.x), y: Int(location.y) + (3*size/4)),
            CGPoint(x: Int(location.x), y: Int(location.y) + (size/4))
        ]
        
        polygon(at: points, isClosed: isClosed)
    }
    
    mutating func hexagons(in rect: CGRect, position: CGPoint, spacing: CGPoint, size: Int, isClosed: Bool = true) {
        for col in stride(from: position.y, to: rect.height, by: spacing.y) {
            for row in stride(from: position.x, to: rect.width, by: spacing.x) {
                hexagon(at: CGPoint(x: row, y: col), size: size, isClosed: isClosed)
                hexagon(at: CGPoint(x: row + rect.minX, y: col - rect.minY), size: size, isClosed: isClosed)
            }
        }
    }
}
