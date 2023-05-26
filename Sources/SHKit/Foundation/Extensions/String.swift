//
//  String.swift
//  
//
//  Created by Mohamed Shemy on 26/05/2023.
//

import Foundation

public extension String {
    
    var isEmptyOrWhitespace: Bool {
        if isEmpty { return true }
        return trimmingCharacters(in: .whitespaces).isEmpty
    }
    
    var isNotEmptyOrWhitespace: Bool { !isEmptyOrWhitespace }
}

public extension String {
    
    var localized: String { NSLocalizedString(self, comment: "") }
}

public extension String {
    
    func orEmpty(_ alt: String) -> String {
        self.isEmpty ? alt : self
    }
}

public extension String {
    
    var capitalizingFirst: String { prefix(1).capitalized + dropFirst() }
        
    mutating func capitalizeFirst() { self = capitalizingFirst }
}

public extension String {
    
    init(key: String, _ arguments: CVarArg...) {
        self = String.localizedStringWithFormat(key.localized, arguments)
    }
}

public extension String {
    
    subscript(bounds: ClosedRange<Int>) -> String {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return String(self[start...end])
    }
    
    subscript(bounds: Range<Int>) -> String {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return String(self[start..<end])
    }
    
    subscript(position: Int) -> String {
        get { position < count ? String(self[index(startIndex, offsetBy: position)]) : "" }
        set {
            guard position < count else { return }
            let n = index(startIndex, offsetBy: position)
            replaceSubrange(n...n, with: "\(newValue)")
        }
    }
}
