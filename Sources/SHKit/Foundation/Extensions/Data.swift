//
//  Data.swift
//  
//
//  Created by Mohamed Shemy on 26/05/2023.
//

import Foundation

public extension Data {
    
    var prettyPrintedJSONString: NSString? {
        guard let object = try? JSONSerialization.jsonObject(with: self, options: []),
              let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]),
              let prettyPrintedString = NSString(data: data, encoding: String.Encoding.utf8.rawValue) else { return nil }
        
        return prettyPrintedString
    }
    
    var toDictionary: [String: Any] {
        (try? self.mapDictionary()) ?? [:]
    }
}
