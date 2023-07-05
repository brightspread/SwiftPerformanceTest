//
//  LeakPerson.swift
//  SwiftPerformanceTest
//
//  Created by Leo on 2023/04/20.
//

import Foundation

class LeakPerson1 {
    let name: String
    
    var person: LeakPerson2?
    
    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
}

class LeakPerson2 {
    var person: LeakPerson1?
}
