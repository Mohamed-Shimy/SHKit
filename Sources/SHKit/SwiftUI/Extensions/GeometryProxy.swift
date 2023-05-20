//
//  GeometryProxy.swift
//  
//
//  Created by Mohamed Shemy on 20/05/2023.
//

import SwiftUI

public extension GeometryProxy {
    
    var globalFrame: CGRect { frame(in: .global) }
    var globalHeight: CGFloat { globalFrame.height }
    var globalWidth: CGFloat { globalFrame.width }
    var globalMinX: CGFloat { globalFrame.minX }
    var globalMinY: CGFloat { globalFrame.minY }
    
    var localFrame: CGRect { frame(in: .local) }
    var localHeight: CGFloat { localFrame.height }
    var localWidth: CGFloat { localFrame.width }
    var localMinX: CGFloat { localFrame.minX }
    var localMinY: CGFloat { localFrame.minY }
}
