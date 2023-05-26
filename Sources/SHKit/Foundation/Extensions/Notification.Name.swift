//
//  Notification.Name.swift
//  
//
//  Created by Mohamed Shemy on 26/05/2023.
//

import Foundation

extension Notification.Name: ExpressibleByStringLiteral {
    
    public init(stringLiteral value: StringLiteralType) {
        self.init(value)
    }
    
    public init(unicodeScalarLiteral value: String) {
        self.init(value)
    }
    
    public init(extendedGraphemeClusterLiteral value: String) {
        self.init(value)
    }
}
