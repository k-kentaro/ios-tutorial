//
//  VideoTableViewCell.swift
//  tutorial
//
//  Created by 木元健太郎 on 2022/05/06.
//

import UIKit

final class VideoTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var thumbnail: UIImageView!
    @IBOutlet private weak var icon: UIImageView!
    @IBOutlet private weak var title: UILabel!
    @IBOutlet private weak var artistInfo: UILabel!


    func configure(model: VideoModel){
        thumbnail.image = model.thumbnail
        icon.image = model.icon
        title.text = model.title
        artistInfo.text = model.artistInfo
    }
    
}
