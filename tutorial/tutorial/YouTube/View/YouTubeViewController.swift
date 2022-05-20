//
//  File.swift
//  tutorial
//
//  Created by 木元健太郎 on 2022/05/02.
//

import RxSwift
import UIKit

final class YouTubeViewController: UIViewController {

    private let videoTableViewCell = R.nib.videoTableViewCell.name
    private let youtubeViewModel = YouTubeViewModel()
    private var disposeBag = DisposeBag()

    @IBOutlet private weak var videoTableView: UITableView! {
        didSet {
            videoTableView.register(UINib(nibName: videoTableViewCell, bundle: nil), forCellReuseIdentifier: videoTableViewCell)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        let target = self.navigationController?.value(forKey: "_cachedInteractionController")
        let recognizer = UIPanGestureRecognizer(target: target, action: Selector(("handleNavigationTransition:")))
        self.view.addGestureRecognizer(recognizer)
        bind()
        youtubeViewModel.requestDataSource()
        videoTableView.rowHeight = 300
    }

    private func bind() {
        youtubeViewModel.models
            .bind(to: videoTableView.rx.items(cellIdentifier: videoTableViewCell, cellType: VideoTableViewCell.self)) { _, element, cell in
                cell.configure(model: element)
            }.disposed(by: disposeBag)
    }
}
