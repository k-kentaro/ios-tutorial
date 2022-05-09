//
//  STYLEHAUS.swift
//  tutorial
//
//  Created by 木元健太郎 on 2022/05/06.
//

import UIKit

final class STYLEHAUSViewController: UIViewController {
    
    private let listTableViewCell = "ListTableViewCell"
    private let listModel = ListModel.createModel()
    
    @IBOutlet private weak var listTableView: UITableView! {
        didSet {
            listTableView.register(UINib(nibName: listTableViewCell, bundle: nil), forCellReuseIdentifier: listTableViewCell)
            listTableView.delegate = self
            listTableView.dataSource = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
    }
    
}

extension STYLEHAUSViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        listModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = listTableView.dequeueReusableCell(withIdentifier: listTableViewCell, for: indexPath) as? ListTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(model: listModel[indexPath.row])
        return cell
    }
    
    
}
