//
//  View + String.swift
//  
//
//  Created by Mohamed Shemy on 26/05/2023.
//

import SwiftUI

public extension String {
    
    var localizedKey: LocalizedStringKey {
        LocalizedStringKey(self)
    }
}

extension String: View {
    
    public var body: Text {
        Text(self.localizedKey)
    }
}
