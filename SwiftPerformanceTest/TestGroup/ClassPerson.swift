//
//  ClassPerson.swift
//  SwiftPerformanceTest
//
//  Created by Leo on 2023/04/12.
//

import Foundation

class ClassPerson {
    var name: String
    var height: Float
    
    init(name: String, height: Float) {
        self.name = name
        self.height = height
    }
    
    @discardableResult
    func getNameAndHeight() -> String { // Table (Dynamic)
        return "\(name), \(height)"
    }
    
    @discardableResult
    @objc dynamic func dynamicGetNameAndHeight() -> String { // Message (Dynamic)
        return "\(name), \(height)"
    }
}
