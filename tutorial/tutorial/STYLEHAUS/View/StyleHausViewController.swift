//
//  StyleHausViewController.swift
//  tutorial
//
//  Created by 木元健太郎 on 2022/05/06.
//

import RxSwift
import UIKit

final class StyleHausViewController: UIViewController {

    private let listTableViewCell = R.nib.listTableViewCell.name
    private let styleHausViewModel = StyleHausViewModel()
    private var disposeBag = DisposeBag()

    @IBOutlet private weak var listTableView: UITableView! {
        didSet {
            listTableView.register(UINib(nibName: listTableViewCell, bundle: nil), forCellReuseIdentifier: listTableViewCell)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true

        let target = self.navigationController?.value(forKey: "_cachedInteractionController")
        let recognizer = UIPanGestureRecognizer(target: target, action: Selector(("handleNavigationTransition:")))
        self.view.addGestureRecognizer(recognizer)
        styleHausViewModel.requestDataSource()
        bind()
    }

    private func bind() {
        styleHausViewModel.models
            .bind(to: listTableView.rx.items(cellIdentifier: listTableViewCell, cellType: ListTableViewCell.self)) { _, element, cell in
                cell.configure(model: element)
            }.disposed(by: disposeBag)
    }
}
