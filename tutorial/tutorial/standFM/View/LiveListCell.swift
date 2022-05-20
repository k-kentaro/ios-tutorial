//
//  LiveListCell.swift
//  tutorial
//
//  Created by 木元健太郎 on 2022/05/09.
//

import Kingfisher
import UIKit

final class LiveListCell: UITableViewCell {

    @IBOutlet private weak var iconImage: UIImageView!
    @IBOutlet private weak var liveTitle: UILabel!
    @IBOutlet private weak var channelName: UILabel!

    func configure(model: StandFMLiveListModel) {
        guard let image = model.iconImage else {
            return
        }
        let url = URL(string: image)
        iconImage.kf.setImage(with: url)
        liveTitle.text = model.liveTitle
        channelName.text = model.channelName
        iconImage.layer.cornerRadius = 10
    }

}
