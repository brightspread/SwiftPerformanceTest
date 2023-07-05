//
//  MainViewModel.swift
//  SwiftPerformanceTest
//
//  Created by Leo on 2023/04/12.
//

import Foundation
import RxSwift

protocol MainViewModelType {
    var testItems: Observable<[TestItem]> { get }
}

final class MainViewModel: MainViewModelType {
    private let disposeBag = DisposeBag()
    var testItems: Observable<[TestItem]>
    
    init() {
        let dispatchTest = TestItem(name: "Dispatch", viewControllerName: "DispatchViewController")
        let memoryLeakTest = TestItem(name: "Memory Leak", viewControllerName: "MemoryLeakViewController")
        testItems = Observable.of([dispatchTest, memoryLeakTest])
    }
}
