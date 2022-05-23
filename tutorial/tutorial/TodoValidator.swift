//
//  TodoValidator.swift
//  tutorial
//
//  Created by 木元健太郎 on 2022/05/19.
//

import Foundation

enum TodoValidationResult {
    case valid
    case emptyTitle(section: String)
    case emptyContents(section: String)
    case emptyFixedDate(section: String)

    var isValid: Bool {
        switch self {
        case .valid:
            return true
        case .emptyTitle:
            return false
        case .emptyContents:
            return false
        case .emptyFixedDate:
            return false
        }
    }

    var errorMessage: String {
        switch self {
        case .valid:
            return ""
        case .emptyTitle(let section):
            return "\(section)の入力がありません"
        case .emptyContents(let section):
            return "\(section)の入力がありません"
        case .emptyFixedDate(let section):
            return "\(section)の入力がありません"
        }
    }
}

final class TodoValidator {
    static let shared: TodoValidator = .init()
    private init() {}

    func validateTodoInfo(title: String?, contents: String?, fixedDate: String?) -> TodoValidationResult {

        guard let title = title, !title.isEmpty else {
            return .emptyTitle(section: "タイトル")
        }

        guard let contents = contents, !contents.isEmpty else {
            return .emptyContents(section: "内容")
        }

        guard let fixedDate = fixedDate, !fixedDate.isEmpty else {
            return .emptyFixedDate(section: "期日")
        }
        return .valid
    }
}
