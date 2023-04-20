//
//  FinalClassNumber.swift
//  SwiftPerformanceTest
//
//  Created by Leo on 2023/04/12.
//

import Foundation

final class FinalClassNumber {
    var num: Int
    
    init(num: Int) {
        self.num = num
    }
    
    @discardableResult
    func getNum() -> Int {
        return num
    }
}
