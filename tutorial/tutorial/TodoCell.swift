//
//  TodoCell.swift
//  tutorial
//
//  Created by 木元健太郎 on 2022/05/19.
//

import UIKit

final class TodoCell: UITableViewCell {
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var contentsLabel: UILabel!
    @IBOutlet weak private var createDayLabel: UILabel!
    @IBOutlet weak private var fixedDateLabel: UILabel!

    func configure(model: ToDoModel) {
        titleLabel.text = model.title
        contentsLabel.text = model.contents
        createDayLabel.text = model.createDay
        fixedDateLabel.text = model.fixedDate
    }
}
