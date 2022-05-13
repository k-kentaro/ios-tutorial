//
//  TableViewCell.swift
//  tutorial
//
//  Created by 木元健太郎 on 2022/05/12.
//

import UIKit
import Kingfisher

final class TableViewCell: UITableViewCell {

   
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var title: UILabel!
    
    
    func configure(model: QiitaModel) {
        guard let image = model.user.profile_image_url else {
            return
        }
        let url = URL(string: image)
        profileImage.kf.setImage(with: url)
        title.text = model.title
    }
    
    
}
