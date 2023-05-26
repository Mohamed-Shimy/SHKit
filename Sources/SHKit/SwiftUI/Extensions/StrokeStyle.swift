//
//  StrokeStyle.swift
//  
//
//  Created by Mohamed Shemy on 26/05/2023.
//

import SwiftUI

public extension StrokeStyle {
    
    static func round(width: CGFloat = 1) -> StrokeStyle {
        StrokeStyle(lineWidth: width, lineCap: .round, lineJoin: .round)
    }
}
