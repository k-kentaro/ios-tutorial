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
        articleImage.image = model.articleImage
        articleText.text = model.articleText
        articleCategory.text = model.articleCategory
        writerName.text = model.writerName
    }
}
