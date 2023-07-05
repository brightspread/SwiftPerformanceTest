//
//  DispatchViewController.swift
//  SwiftPerformanceTest
//
//  Created by Leo on 2023/04/12.
//

import UIKit
import RxSwift
import RxCocoa

final class DispatchViewController: UIViewController {
    
    @IBOutlet weak var lbResult: UILabel!
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    /**
            클래스의 Static Method, Dynamic Method 성능 비교를 진행합니다.
     
     두 함수를 10만번 호출하고 걸린 시간을 비교합니다.
     func getNameAndHeight() -> String { // Table
         return "\(name), \(height)"
     }
     
     @objc dynamic func dynamicGetNameAndHeight() -> String { // Message
         return "\(name), \(height)"
     }

     */
    @IBAction func 클래스내TableMessage비교(_ sender: Any) {
        let person = ClassPerson(name: "홍길동", height: 170)
        
        var staticTime = 0.0
        var dynamicTime = 0.0
        
        for _ in 0..<100000 {
            Utils.shared.startMeasure()
            person.getNameAndHeight()
            Utils.shared.endMeasure()
            staticTime += Utils.shared.getMeasureTime()
            
            Utils.shared.startMeasure()
            person.dynamicGetNameAndHeight()
            Utils.shared.endMeasure()
            dynamicTime += Utils.shared.getMeasureTime()
        }
        lbResult.text = """
        결과
        Static Time : \(String(format:"%.8f", staticTime))
        Dynamic Time : \(String(format:"%.8f", dynamicTime))
        """
    }
    
    @IBAction func 클래스와구조체함수비교(_ sender: Any) {
        let classPerson = ClassPerson(name: "홍길동", height: 170)
        let structPerson = StructPerson(name: "홍길동", height: 170)
        
        var classTime = 0.0
        var structTime = 0.0

        for _ in 0..<100000 {
            Utils.shared.startMeasure()
            classPerson.getNameAndHeight()
            Utils.shared.endMeasure()
            classTime += Utils.shared.getMeasureTime()
            
            Utils.shared.startMeasure()
            structPerson.getNameAndHeight()
            Utils.shared.endMeasure()
            structTime += Utils.shared.getMeasureTime()
        }
        lbResult.text = """
        결과
        Class Time : \(String(format:"%.8f", classTime))
        Struct Time : \(String(format:"%.8f", structTime))
        """
    }
    
    @IBAction func Final클래스와일반클래스비교(_ sender: Any) {
        let finalClassNumber = FinalClassNumber(num: 0)
        let classNumber = ClassNumber(num: 0)
        
        var finalTime = 0.0
        var normalTime = 0.0

        for _ in 0..<1000000 {

            Utils.shared.startMeasure()
            classNumber.getNum()
            Utils.shared.endMeasure()
            normalTime += Utils.shared.getMeasureTime()
            
            Utils.shared.startMeasure()
            finalClassNumber.getNum()
            Utils.shared.endMeasure()
            finalTime += Utils.shared.getMeasureTime()
        }
        
        lbResult.text = """
        결과
        Final 클래스 수행시간 : \(String(format:"%.8f", finalTime))
        일반 클래스 수행시간 : \(String(format:"%.8f", normalTime))
        """
    }
}
