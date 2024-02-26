//
//  Image + ImageSource.swift
//  
//
//  Created by Mohamed Shemy on 26/05/2023.
//

import SwiftUI

extension Image {
    
    public init(source: ImageSource) {
        switch source {
            case .resource(let value, let bundle):
                self.init(value, bundle: bundle)
            case .system(let value):
                self.init(systemName: value)
            case .ui(let image):
                self.init(image: image)
            case let .resourceWithText(name, bundle, text):
                self.init(name, bundle: bundle, label: text)
            case let .decorative(name, bundle):
                self.init(decorative: name, bundle: bundle)
        }
    }
    
    public init(image: PlatformImage) {
        #if os(macOS)
        self.init(nsImage: image)
        #elseif os(iOS)
        self.init(uiImage: image)
        #endif
    }
}
