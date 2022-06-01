//
//  FavoriteViewController.swift
//  tutorial
//
//  Created by 木元健太郎 on 2022/05/23.
//

import Instantiate
import InstantiateStandard
import RxSwift
import UIKit

final class FavoriteViewController: UIViewController {
    
    private let favoriteItemCell = R.nib.favoriteItemCell.name
    private var viewModel = MCUViewModel()
    private var disposeBag = DisposeBag()
    private var loadingIndicator = UIActivityIndicatorView()
    @IBOutlet weak var favoriteIsEmptyView: UIImageView!
    
    
    @IBOutlet weak var favoriteTableView: UITableView! {
        didSet {
            favoriteTableView.register(UINib(nibName: favoriteItemCell, bundle: nil), forCellReuseIdentifier: favoriteItemCell)
            favoriteTableView.allowsSelection = false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadingIndicator.center = view.center
        loadingIndicator.style = .large
        view.addSubview(loadingIndicator)
        bind()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.requestFavoriteData()
    }
    
    private func bind() {
        //インジケーターのセットアップ
        viewModel.isAnimating.asDriver()
            .drive(loadingIndicator.rx.isAnimating)
            .disposed(by: disposeBag)
        viewModel.isAnimating.asDriver()
            .map { !$0 }
            .drive(loadingIndicator.rx.isHidden)
            .disposed(by: disposeBag)
        //インジケーターのセットアップ
        viewModel.isCellEmpty.asDriver()
            .drive(favoriteIsEmptyView.rx.isOpaque)
            .disposed(by: disposeBag)
        viewModel.isCellEmpty.asDriver()
            .map { !$0 }
            .drive(favoriteIsEmptyView.rx.isHidden)
            .disposed(by: disposeBag)
        //TableViewのセットアップ
        viewModel.favoriteDataModel.bind(to: favoriteTableView.rx.items(cellIdentifier: favoriteItemCell, cellType: FavoriteItemCell.self)) { [self] row, element, cell in
            cell.detailButton.addTarget(nil, action: #selector(cell.tapDetailButton(_:)), for: .touchUpInside)
            cell.detailButton.tag = row
            cell.favoriteButton.tag = row
            cell.catchDataDelegate = self
            cell.catchFavoriteDelegate = self
            cell.configure(model: element)
        }.disposed(by: disposeBag)
    }
}

extension FavoriteViewController: CatchDataProtocol {
    func catchData(row: Int) {
        viewModel.getFavoriteDetailData(row: row)
        let vc = DetailViewController(with: viewModel)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension FavoriteViewController: CatchFavoriteProtocol {
    func catchFavorite(row: Int) {
        let alert = UIAlertController(title: "お気に入りから削除", message: "本当に削除しますか？", preferredStyle: UIAlertController.Style.alert)
        let didDeleteAlert = UIAlertController(title: "削除完了", message: "削除しました", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "キャンセル", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "削除", style: .default, handler: { [weak self] (_) in
            self?.viewModel.checkFavoriteList(row: row)
            didDeleteAlert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self?.present(didDeleteAlert, animated: true, completion: nil)
        }))
        present(alert, animated: true, completion: nil)
    }
}

extension FavoriteViewController: StoryboardInstantiatable {
    func inject(_ dependency: MCUViewModel) {
        viewModel = dependency
    }
}
