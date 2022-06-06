//
//  MCUmovieViewController.swift
//  tutorial
//
//  Created by 木元健太郎 on 2022/05/23.
//

import Instantiate
import InstantiateStandard
import RxSwift
import UIKit

final class MCUmovieViewController: UIViewController {
    
    private let mcuMovieCell = "MCUmovieCell"
    private var viewModel = MCUViewModel()
    private var disposeBag = DisposeBag()
    
    private var loadingIndicator = UIActivityIndicatorView()
    
    @IBOutlet  weak var movieTableView: UITableView! {
        didSet {
            movieTableView.register(UINib(nibName: mcuMovieCell, bundle: nil), forCellReuseIdentifier: mcuMovieCell)
            movieTableView.allowsSelection = false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadingIndicator.center = view.center
        loadingIndicator.style = .large
        view.addSubview(loadingIndicator)
        bind()
        viewModel.requestMovieData()
    }
    
    private func bind() {
        // インジケーターのセットアップ
        viewModel.isAnimating.asDriver()
            .drive(loadingIndicator.rx.isAnimating)
            .disposed(by: disposeBag)
        viewModel.isAnimating.asDriver()
            .map { !$0 }
            .drive(loadingIndicator.rx.isHidden)
            .disposed(by: disposeBag)
        
        // TableViewのセットアップ
        viewModel.movieModels
            .bind(to: movieTableView.rx.items(cellIdentifier: mcuMovieCell, cellType: MCUmovieCell.self)) { [self] row, element, cell in
                cell.detailButton.addTarget(nil, action: #selector(cell.tappedDetailButton(_:)), for: .touchUpInside)
                cell.detailButton.tag = row
                cell.favoriteButton.tag = row
                cell.catchDataDelegate = self
                cell.catchFavoriteDelegate = self
                cell.configure(model: element)
            }.disposed(by: disposeBag)
    }
}

extension MCUmovieViewController: CatchDataProtocol {
    func catchData(row:Int) {
        viewModel.getMovieDetailData(row: row)
        let vc = DetailViewController(with: viewModel)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension MCUmovieViewController: CatchFavoriteProtocol {
    func catchFavorite(row: Int) {
        viewModel.checkFavoriteStateMovie(row: row)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            //お気に入りに入っているか確認して、アラートを出す
            if self.viewModel.isFavorite == [true] {
                let alert = UIAlertController(title: "お気に入りから削除", message: "本当に削除しますか？", preferredStyle: UIAlertController.Style.alert)
                let didDeleteAlert = UIAlertController(title: "削除完了", message: "削除しました", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "キャンセル", style: .cancel, handler: nil))
                alert.addAction(UIAlertAction(title: "削除", style: .default, handler: { [weak self] (_) in
                    self?.viewModel.checkSaveMovie(row: row)
                    didDeleteAlert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                    self?.present(didDeleteAlert, animated: true, completion: nil)
                }))
                self.present(alert, animated: true, completion: nil)
            } else {
                let alert = UIAlertController(title: "保存完了！", message: "お気に入りに追加されました", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak self] (_) in
                    self?.viewModel.checkSaveMovie(row: row)
                }))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
}

extension MCUmovieViewController: StoryboardInstantiatable {
    func inject(_ dependency: MCUViewModel) {
        viewModel = dependency
    }
}
