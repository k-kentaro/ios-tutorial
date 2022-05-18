//
//  StandFMViewController.swift
//  tutorial
//
//  Created by 木元健太郎 on 2022/05/06.
//

import RxSwift
import UIKit

final class StandFMViewController: UIViewController {

    private let liveListCell = R.nib.liveListCell.name
    private let standFMViewModel = StandFMViewModel()
    private var disposeBag = DisposeBag()

    @IBOutlet private weak var liveListTableView: UITableView! {
        didSet {
            liveListTableView.register(UINib(nibName: liveListCell, bundle: nil), forCellReuseIdentifier: liveListCell)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true

        let target = self.navigationController?.value(forKey: "_cachedInteractionController")
        let recognizer = UIPanGestureRecognizer(target: target, action: Selector(("handleNavigationTransition:")))
        self.view.addGestureRecognizer(recognizer)

        standFMViewModel.requestDataSource()
        bind()
    }

    private func bind() {
        standFMViewModel.models
            .bind(to: liveListTableView.rx.items(cellIdentifier: liveListCell, cellType: LiveListCell.self)) { _, element, cell in cell.configure(model: element) }.disposed(by: disposeBag)
    }
}
