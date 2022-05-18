//
//  QiitaClientViewController.swift
//  tutorial
//
//  Created by 木元健太郎 on 2022/05/12.
//

import RxCocoa
import RxOptional
import RxSwift
import UIKit

final class QiitaClientViewController: UIViewController {

    private let tableViewCell = R.nib.tableViewCell.name
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.register(UINib(nibName: tableViewCell, bundle: nil), forCellReuseIdentifier: tableViewCell)
        }
    }

    private let viewModel = QiitaViewModel()
    private var disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
        viewModel.requestDataSource()
    }

    private func bind() {
        viewModel.models
            .bind(to: tableView.rx.items(cellIdentifier: tableViewCell, cellType: TableViewCell.self)) { _, element, cell in cell.configure(model: element) }.disposed(by: disposeBag)

        tableView.rx.modelSelected(QiitaModel.self)
            .subscribe(onNext: { response in
                guard let url = response.url,
                      let _url = URL(string: url) else {
                    return
                }
                UIApplication.shared.open(_url, options: [:], completionHandler: nil)
            })
            .disposed(by: disposeBag)
    }

}
