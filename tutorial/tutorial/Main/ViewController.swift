//
//  ViewController.swift
//  tutorial
//
//  Created by 中田稔弘 on 2022/04/15.
//

import UIKit

final class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func tapdYouTube(_ sender: Any) {
        guard let vc = R.storyboard.youTube.instantiateInitialViewController() else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func taodStyleHaus(_ sender: Any) {
        guard let vc = R.storyboard.styleHaus.instantiateInitialViewController() else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func tapdStandFM(_ sender: Any) {
        guard let vc = R.storyboard.standFM.instantiateInitialViewController() else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func tapdUserDefaults(_ sender: Any) {
        guard let vc = R.storyboard.userDefaults.instantiateInitialViewController() else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func tapdQiitaClient(_ sender: Any) {
        guard let vc = R.storyboard.qiitaClient.instantiateInitialViewController() else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func tapdRealmToDo(_ sender: Any) {
        guard let vc = R.storyboard.todo.instantiateInitialViewController() else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func tapdMCU(_ sender: Any) {
        guard let vc = R.storyboard.home.instantiateInitialViewController() else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
