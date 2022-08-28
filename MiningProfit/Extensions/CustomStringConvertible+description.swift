//
//  CustomStringConvertible+description.swift
//  MiningProfit
//
//  Created by Alexandr Rodionov on 28.08.22.
//

import Foundation

extension CustomStringConvertible where Self: Codable {
    
    var description: String {
        var description = "\n \(type(of: self)) \n"
        
        // Интроспекция
        let selfMirror = Mirror(reflecting: self)
        
        for child in selfMirror.children {
            if let propertyName = child.label {
                description += "\(propertyName): \(child.value)\n"
            }
        }
        return description
    }
    
}