//
//  ClassNumber.swift
//  SwiftPerformanceTest
//
//  Created by Leo on 2023/04/12.
//

import Foundation

class ClassNumber {
    var num: Int
    
    init(num: Int) {
        self.num = num
    }
    
    @discardableResult
    func getNum() -> Int {
        return num
    }
}
