//
//  VideoTableViewCell.swift
//  tutorial
//
//  Created by 木元健太郎 on 2022/05/06.
//

import Kingfisher
import UIKit

final class VideoTableViewCell: UITableViewCell {

    @IBOutlet private weak var thumbnail: UIImageView!
    @IBOutlet private weak var icon: UIImageView!
    @IBOutlet private weak var title: UILabel!
    @IBOutlet private weak var artistInfo: UILabel!

    func configure(model: YouTubeVideoModel) {
        guard let thumbnailImage = model.thumbnail,
              let iconImage = model.icon else {
            return
        }
        let thumbnailUrl = URL(string: thumbnailImage)
        let iconUrl = URL(string: iconImage)
        thumbnail.kf.setImage(with: thumbnailUrl)
        icon.kf.setImage(with: iconUrl)
        title.text = model.title
        artistInfo.text = model.artistInfo
        icon.layer.cornerRadius = 55 / 2
    }

}
