//
//  Comparable.swift
//  
//
//  Created by Mohamed Shemy on 20/05/2023.
//

import Foundation

public extension Comparable {
    
    func inRange(closed lower: Self, _ upper: Self) -> Bool {
        guard lower <= upper else { return false }
        return self >= lower && self <= upper
    }
    
    func inRange(opened lower: Self, _ upper: Self) -> Bool {
        guard lower < upper else { return false }
        return self >= lower && self < upper
    }
    
    func inRange<C>(of collection: C) -> Bool where C: Collection, C.Index == Self {
        self.inRange(opened: collection.startIndex, collection.endIndex)
    }
    
    func inRange(of range: ClosedRange<Self>) -> Bool {
        range ~= self
    }
    
    func inRange(of range: Range<Self>) -> Bool {
        range ~= self
    }
}
