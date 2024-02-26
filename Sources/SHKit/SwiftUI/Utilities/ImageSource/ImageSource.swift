//
//  ImageSource.swift
//  
//
//  Created by Mohamed Shemy on 26/05/2023.
//

import SwiftUI

#if canImport(UIKit)
import UIKit

public typealias PlatformImage = UIImage

#elseif canImport(AppKit)

import AppKit

public typealias PlatformImage = NSImage
#endif

public enum ImageSource {
    
    case system(String)
    case resource(String, Bundle? = nil)
    case ui(PlatformImage)
    case resourceWithText(String, Bundle? = nil, Text)
    case decorative(String, Bundle? = nil)
}
