//
//  UIRectCorner.swift
//  
//
//  Created by Mohamed Shemy on 20/05/2023.
//

import UIKit

public extension UIRectCorner {
    
    static let top: UIRectCorner = [.topLeft, .topRight]
    static let bottom: UIRectCorner = [.bottomLeft, .bottomRight]
    static let leading: UIRectCorner = [.topLeft, .bottomLeft]
    static let trailing: UIRectCorner = [.topRight, .bottomRight]
}
