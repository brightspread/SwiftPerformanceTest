//
//  Utils.swift
//  SwiftPerformanceTest
//
//  Created by Leo on 2023/04/12.
//

import Foundation

final class Utils {
    static var shared: Utils = Utils()

    private init() {}

    private var measureStartTime: CFAbsoluteTime!
    private var measureEndTime: CFAbsoluteTime!
    
    func startMeasure() {
        measureStartTime = CFAbsoluteTimeGetCurrent()
    }
    
    func endMeasure() {
        measureEndTime = CFAbsoluteTimeGetCurrent()
    }
    
    func getMeasureTime() -> CFAbsoluteTime {
        return measureEndTime - measureStartTime
    }
}
