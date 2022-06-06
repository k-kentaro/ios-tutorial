//
//  SwipeViewController.swift
//  tutorial
//
//  Created by 木元健太郎 on 2022/05/26.
//

import Parchment
import UIKit

final class SwipeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpParchment()
    }
    
    // Parchmentのセットアップ
    func setUpParchment() {
        guard let mcuMovieVC = R.storyboard.mcUmovie().instantiateInitialViewController(),
              let mcuDramaVC = R.storyboard.mcUdrama().instantiateInitialViewController() else {
            return
        }
        mcuMovieVC.title = "映画"
        mcuDramaVC.title = "ドラマ"
        let pagingViewController = PagingViewController(viewControllers: [
            mcuMovieVC,
            mcuDramaVC
        ])
        addChild(pagingViewController)
        view.addSubview(pagingViewController.view)
        
        pagingViewController.didMove(toParent: self)
        pagingViewController.view.translatesAutoresizingMaskIntoConstraints = false
        pagingViewController.textColor = .black
        pagingViewController.selectedTextColor = .red
        pagingViewController.indicatorColor = .red
        pagingViewController.backgroundColor = .white
        pagingViewController.view.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        pagingViewController.view.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        pagingViewController.view.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        pagingViewController.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        self.view.backgroundColor = .white
    }
}
