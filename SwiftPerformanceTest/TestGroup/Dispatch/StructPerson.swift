//
//  StructPerson.swift
//  SwiftPerformanceTest
//
//  Created by Leo on 2023/04/12.
//

import Foundation

struct StructPerson {
    var name: String
    var height: Float
    
    @discardableResult
    func getNameAndHeight() -> String { // Static
        return "\(name), \(height)"
    }
}
