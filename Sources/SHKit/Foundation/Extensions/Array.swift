//
//  Array.swift
//  
//
//  Created by Mohamed Shemy on 26/05/2023.
//

import Foundation

public extension Array {
    
    func shifted(by distance: Int = 1) -> [Element] {
        let offsetIndex = distance >= 0 ?
        self.index(startIndex, offsetBy: distance, limitedBy: endIndex) :
        self.index(endIndex, offsetBy: distance, limitedBy: startIndex)
        
        guard let index = offsetIndex else { return self }
        return Array(self[index ..< endIndex] + self[startIndex ..< index])
    }
    
    mutating func shift(withDistance distance: Int = 1) {
        self = shifted(by: distance)
    }
}
