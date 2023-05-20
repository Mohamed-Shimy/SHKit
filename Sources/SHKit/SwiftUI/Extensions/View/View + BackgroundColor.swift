//
//  View + BackgroundColor.swift
//  
//
//  Created by Mohamed Shemy on 20/05/2023.
//

import SwiftUI

public extension View {
    
    func backgroundColor(_ color: Color) -> some View {
        background(color)
    }
    
    func backgroundColor(ui color: PlatformColor) -> some View {
        background(Color(color))
    }
}
