//
//  FinalClassPerson.swift
//  SwiftPerformanceTest
//
//  Created by Leo on 2023/04/12.
//

import Foundation

final class FinalClassPerson {
    var name: String
    var height: Float
    
    init(name: String, height: Float) {
        self.name = name
        self.height = height
    }
    
    @discardableResult
    func getNameAndHeight() -> String { // static
        return "\(name), \(height)"
    }
    
    @discardableResult
    @objc dynamic func dynamicGetNameAndHeight() -> String { // Message
        return "\(name), \(height)"
    }
}
