//
//  HomeViewController.swift
//  tutorial
//
//  Created by 木元健太郎 on 2022/05/23.
//

import Instantiate
import InstantiateStandard
import Parchment
import UIKit

final class HomeViewController: UITabBarController {
    
    private var viewModel = MCUViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().tintColor = UIColor.red
        setUpTab()
    }
    
    //Tabbarのセットアップ
    func setUpTab() {
        let swipeViewController = SwipeViewController()
        swipeViewController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)
        let favoriteViewController = FavoriteViewController(with: viewModel)
        favoriteViewController.tabBarItem = UITabBarItem(title: "お気に入り", image: UIImage(systemName: "star.fill"), tag: 0)
        self.viewControllers = [swipeViewController, favoriteViewController]
    }
}

extension HomeViewController: StoryboardInstantiatable {
    func inject(_ dependency: MCUViewModel) {
        viewModel = dependency
    }
}
