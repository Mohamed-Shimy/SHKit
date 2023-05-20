//
//  Color + init.swift
//  
//
//  Created by Mohamed Shemy on 20/05/2023.
//

import SwiftUI

public extension Color {
    
    init(red: Int, green: Int, blue: Int, opacity: Double = 1) {
        assert(0...255 ~= red, "Invalid red component")
        assert(0...255 ~= green, "Invalid green component")
        assert(0...255 ~= blue, "Invalid blue component")
        
        self.init(red: Double(red) / 255.0, green: Double(green) / 255.0, blue: Double(blue) / 255.0, opacity: opacity)
    }
    
    init(hex: Int) {
        self.init(
            red: (hex >> 16) & 0xFF,
            green: (hex >> 8) & 0xFF,
            blue: hex & 0xFF
        )
    }
}
