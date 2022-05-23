//
//  TodoModel.swift
//  tutorial
//
//  Created by 木元健太郎 on 2022/05/19.
//

import Foundation
import RealmSwift

final class ToDoModel: Object {
    @objc dynamic var title: String?
    @objc dynamic var contents: String?
    @objc dynamic var createDay: String?
    @objc dynamic var fixedDate: String?
}
