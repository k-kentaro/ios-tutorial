//
//  DetailViewController.swift
//  tutorial
//
//  Created by 木元健太郎 on 2022/05/23.
//

import Instantiate
import InstantiateStandard
import Kingfisher
import RxSwift
import UIKit

final class DetailViewController: UIViewController {
    
    @IBOutlet weak var detailTitle: UILabel!
    @IBOutlet weak var detailReleaseDate: UILabel!
    @IBOutlet weak var detailCoverImage: UIImageView!
    @IBOutlet weak var detailDescription: UITextView!
    @IBOutlet weak var showTrailerButton: UIButton!
    
    private var disposeBag = DisposeBag()
    private var viewModel = MCUViewModel()
    private var loadingIndicator = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showTrailerButton.layer.cornerRadius = 10
        showTrailerButton.addTarget(self, action: #selector(tapShowTrailerButton), for: .touchUpInside)
        loadingIndicator.center = view.center
        loadingIndicator.style = .large
        view.addSubview(loadingIndicator)
        bind()
    }
    
    private func bind() {
        viewModel.isAnimating.asDriver()
            .drive(loadingIndicator.rx.isAnimating)
            .disposed(by: disposeBag)
        viewModel.isAnimating.asDriver()
            .map { !$0 }
            .drive(loadingIndicator.rx.isHidden)
            .disposed(by: disposeBag)
        viewModel.detailModels.bind { respons in
            guard let image = respons.coverUrl else {
                return
            }
            let url = URL(string: image)
            self.detailTitle.text = respons.title
            self.detailReleaseDate.text = respons.releaseDate
            self.detailCoverImage.kf.setImage(with: url)
            self.detailDescription.text = respons.overview
        }.disposed(by: disposeBag)
    }
    
    @objc private func tapShowTrailerButton() {
        viewModel.detailModels.bind { respons in
            guard let trailerUrl = respons.trailerUrl,
                  let url = URL(string: trailerUrl) else {
                return
            }
            if UIApplication.shared.canOpenURL(url) {
                if #available(iOS 10.0, *) {
                    UIApplication.shared.open(url, completionHandler: { (_) in
                    })
                } else {
                    UIApplication.shared.openURL(url)
                }
            }
        }
    }
}

extension DetailViewController: StoryboardInstantiatable {
    func inject(_ dependency: MCUViewModel) {
        viewModel = dependency
    }
}
