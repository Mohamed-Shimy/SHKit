//
//  View + ForegroundColor.swift
//  
//
//  Created by Mohamed Shemy on 20/05/2023.
//

import SwiftUI

public extension View {
    
    func foregroundColor(ui color: PlatformColor) -> some View {
        self.foregroundColor(Color(color))
    }
}
