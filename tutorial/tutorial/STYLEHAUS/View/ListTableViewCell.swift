//
//  ListTableViewCell.swift
//  tutorial
//
//  Created by 木元健太郎 on 2022/05/09.
//

import UIKit

final class ListTableViewCell: UITableViewCell {

    @IBOutlet private weak var articleImage: UIImageView!
    @IBOutlet private weak var articleText: UITextView!
    @IBOutlet private weak var articleCategory: UILabel!
    @IBOutlet private weak var writerName: UILabel!

    func configure(model: StyleHausListModel) {
        guard let image = model.articleImage else {
            return
        }
        let url = URL(string: image)
        articleImage.kf.setImage(with: url)
        articleText.text = model.articleText
        articleCategory.text = model.articleCategory
        writerName.text = model.writerName
    }
}
