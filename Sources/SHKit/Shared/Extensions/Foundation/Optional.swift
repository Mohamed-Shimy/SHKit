//
//  Optional.swift
//  
//
//  Created by Mohamed Shemy on 26/05/2023.
//

import Foundation

public extension Optional {
    
    var isNil: Bool {
        if case .none = self {
            return true
        }
        return false
    }
}

public extension Optional {
    
    func orNil(_ alt: Wrapped) -> Wrapped {
        switch self {
            case .none:
                return alt
            case .some(let wrapped):
                return wrapped
        }
    }
}

public extension Optional where Wrapped == String {
 
    func orNilEmpty(_ alt: Wrapped) -> Wrapped {
        switch self {
            case .some(let wrapped) where wrapped.isNotEmpty:
                return wrapped
            default:
                return alt
        }
    }
}
