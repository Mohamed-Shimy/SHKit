//
//  ImageSource.swift
//  
//
//  Created by Mohamed Shemy on 26/05/2023.
//

import SwiftUI

public enum ImageSource {
    
    case system(String)
    case resource(String, Bundle? = nil)
    case ui(UIImage)
    case resourceWithText(String, Bundle? = nil, Text)
    case decorative(String, Bundle? = nil)
}
