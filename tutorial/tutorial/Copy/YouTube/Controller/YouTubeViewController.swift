//
//  File.swift
//  tutorial
//
//  Created by 木元健太郎 on 2022/05/02.
//

import UIKit

final class YouTubeViewController: UIViewController {
    
    private let videoModel = YouTubeVideoModel.createModel()
    private let cellname = "VideoTableViewCell"
    private let reuseId = "VideoTableViewCell"
    @IBOutlet private weak var videoTableView: UITableView! {
        didSet{
            let cellNib = UINib(nibName: cellname, bundle: nil)
            videoTableView.register(cellNib, forCellReuseIdentifier: reuseId)
            videoTableView.delegate = self
            videoTableView.dataSource = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        
    }
}

extension YouTubeViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        videoModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = videoTableView.dequeueReusableCell(withIdentifier: reuseId, for: indexPath) as? VideoTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(model: videoModel[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    
}


