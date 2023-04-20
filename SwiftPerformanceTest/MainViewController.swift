//
//  ViewController.swift
//  SwiftPerformanceTest
//
//  Created by Leo on 2023/04/12.
//

import UIKit
import RxSwift
import RxCocoa

final class MainViewController: UIViewController {
    
    @IBOutlet weak var pTableView: UITableView!
    
    private let viewModel: MainViewModelType = MainViewModel()
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
    }
    
    private func bind() {
        viewModel.testItems
            .bind(to: pTableView.rx.items) { [weak self] (tv, index, element) in
                let cell = UITableViewCell()
                var contentConfiguration = cell.defaultContentConfiguration()
                contentConfiguration.text = element.name
                cell.contentConfiguration = contentConfiguration
                return cell
            }.disposed(by: disposeBag)
        
        Observable.zip(
            pTableView.rx.itemSelected,
            pTableView.rx.modelSelected(TestItem.self))
        .observe(on: MainScheduler.instance)
        .subscribe(onNext: { [weak self] (indexPath, item) in
            self?.pTableView.deselectRow(at: indexPath, animated: true)
            guard let vc = self?.storyboard?.instantiateViewController(withIdentifier: item.viewControllerName ?? "") else {
                print("No ViewController : \(item.viewControllerName)")
                return
            }
            self?.navigationController?.pushViewController(vc, animated: true)

        }).disposed(by: disposeBag)
    }
}

