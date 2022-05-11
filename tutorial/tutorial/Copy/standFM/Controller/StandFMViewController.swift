//
//  standFMViewController.swift
//  tutorial
//
//  Created by 木元健太郎 on 2022/05/06.
//

import UIKit

final class StandFMViewController: UIViewController {
    
    private let liveListCell = "LiveListCell"
    private let liveListModel = StandFMLiveListModel.createModel()
    
    @IBOutlet private weak var liveListTableView: UITableView! {
        didSet {
            liveListTableView.register(UINib(nibName: liveListCell, bundle: nil), forCellReuseIdentifier: liveListCell)
            liveListTableView.dataSource = self
            liveListTableView.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        
        let target = self.navigationController?.value(forKey: "_cachedInteractionController")
        let recognizer = UIPanGestureRecognizer(target: target, action: Selector(("handleNavigationTransition:")))
        self.view.addGestureRecognizer(recognizer)
        
    }
    
}

extension StandFMViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        liveListModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = liveListTableView.dequeueReusableCell(withIdentifier: liveListCell, for: indexPath) as? LiveListCell else {
            return UITableViewCell()
        }
        cell.configure(model: liveListModel[indexPath.row])
        return cell
    }
    
    
}
