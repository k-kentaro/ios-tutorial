//
//  LiveListCell.swift
//  tutorial
//
//  Created by 木元健太郎 on 2022/05/09.
//

import UIKit

final class LiveListCell: UITableViewCell {

    @IBOutlet private weak var iconImage: UIImageView!
    @IBOutlet private weak var liveTitle: UILabel!
    @IBOutlet private weak var channelName: UILabel!

    func configure(model: StandFMLiveListModel) {
        iconImage.image = model.iconImage
        liveTitle.text = model.liveTitle
        channelName.text = model.channelName
        iconImage.layer.cornerRadius = 10
    }

}
