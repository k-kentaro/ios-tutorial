//
//  QiitaClientViewController.swift
//  tutorial
//
//  Created by 木元健太郎 on 2022/05/12.
//

import UIKit
import RxSwift
import RxCocoa
import RxOptional

final class QiitaClientViewController: UIViewController {
    
    private let tableViewCell = "TableViewCell"
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.register(UINib(nibName: tableViewCell, bundle: nil), forCellReuseIdentifier: tableViewCell)
            tableView.dataSource = self
            tableView.delegate = self
        }
    }
    
    private let viewModel = QiitaViewModel()
    private lazy var input:QiitaViewModelInput = viewModel
    private lazy var output:QiitaViewModelOutput = viewModel
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindOutputStream()
        print(output.models)
    }
    
    
    private func bindOutputStream() {
        //outputの「modelsに変化があったよ」というストリームが流れてきたらテーブルを更新
        output.changeModelsObservable.subscribeOn(MainScheduler.instance).subscribe(onNext: {
            self.tableView.reloadData()
        }, onError: { error in
            print(error.localizedDescription)
        }).disposed(by: rx.disposeBag)
    }
}


extension QiitaClientViewController: UITableViewDataSource,UITableViewDelegate  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return output.models.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: tableViewCell, for: indexPath) as? TableViewCell
        else { return UITableViewCell() }
        let qiitaModel = output.models[indexPath.item]
        cell.configure(model: qiitaModel)
        return cell
    }
}
