//
//  MemoryLeakViewController.swift
//  SwiftPerformanceTest
//
//  Created by Leo on 2023/04/20.
//

import UIKit

final class MemoryLeakViewController: UIViewController {
    
    var student1: LeakPerson1?
    var student2: LeakPerson1?
    var student3: LeakPerson1?
    
    var leak1: LeakPerson1?
    var leak2: LeakPerson2?
    
    @IBOutlet weak var lbResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func 정상해제테스트(_ sender: Any) {
        student1 = LeakPerson1(name: "명훈")
        student1 = nil
        lbResult.text = """
        테스트
        student1 = LeakPerson1(name: "명훈")
        student1 = nil

        결과
        student1 : \(student1)
        """
    }
    
    @IBAction func 해제안됨테스트(_ sender: Any) {
        // Leak 1번 - 뷰컨 나갈시 해제됨
        student1 = LeakPerson1(name: "명훈")
        student2 = student1
        student3 = student1
        student1 = nil
        lbResult.text = """
        테스트
        student1 = LeakPerson1(name: "명훈")
        student2 = student1
        student3 = student1
        
        결과
        student1 : \(student1)
        """
    }
    
    @IBAction func 상호참조테스트(_ sender: Any) {
        // Leak 2번 - 뷰컨 나갈시에도 해제 안됨
        leak1 = LeakPerson1(name: "철수")
        leak2 = LeakPerson2()
        leak1?.person = leak2
        leak2?.person = leak1
        
        lbResult.text = """
        테스트
        leak1 = LeakPerson1(name: "철수")
        leak2 = LeakPerson2()
        leak1?.person = leak2
        leak2?.person = leak1
        """
    }
    
    @IBAction func 네트워크테스트5초(_ sender: Any) {
        lbResult.text = """
        테스트
        네트워크 timeout 테스트 - 5초까지 기다림
        """
        delayedAllocAsyncCall(5)
    }
    
    @IBAction func 네트워크테스트999초(_ sender: Any) {
        lbResult.text = """
        테스트
        네트워크 timeout 테스트 - 999초까지 기다림
        """
        delayedAllocAsyncCall(999)
    }
    
    func delayedAllocAsyncCall(_ timeout: TimeInterval) {
        let url = URL(string: "https://www.google.com:81")!

        let sessionConfig = URLSessionConfiguration.default
        sessionConfig.timeoutIntervalForRequest = timeout
        sessionConfig.timeoutIntervalForResource = timeout
        let session = URLSession(configuration: sessionConfig)

        let task = session.downloadTask(with: url) { [weak self] localURL, _, error in
            DispatchQueue.main.async {
                self?.lbResult.text = """
                테스트
                네트워크 timeout 테스트 - \(timeout)초까지 기다림
                
                결과
                \(error)
                """
            }
            print(error)
            guard let localURL = localURL else { return }
            let contents = (try? String(contentsOf: localURL)) ?? "No contents"
            print(contents)
            print(self?.view.description) // Strong Capture를 통해 VC2 메모리 Leak 발생
        }
        task.resume()
    }

}
