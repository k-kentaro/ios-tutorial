//
//  Validation.swift
//  tutorial
//
//  Created by 木元健太郎 on 2022/05/10.
//

import Foundation

enum ValidationResult {
    case valid
    case emptyName(section: String)
    case emptyAge(section: String)
    case emptyBirthday(section: String)
    
    
    var isValid: Bool {
        switch self {
        case .valid:
            return true
        case .emptyName:
            return false
        case .emptyAge:
            return false
        case .emptyBirthday:
            return false
        }
    }

    var errorMessage: String {
        switch self {
        case .valid:
            return ""
        case .emptyName(let section):
            return "\(section)の入力がありません"
        case .emptyAge(let section):
            return "\(section)の入力がありません"
        case .emptyBirthday(let section):
            return "\(section)の入力がありません"
        }
    }
}

final class Validator {

    static let shared: Validator = .init()
    private init() {}

    func validateUserInfo(name: String?, age: Int?, birthday: String?) -> ValidationResult {
        guard let name = name, !name.isEmpty else {
            return .emptyName(section: "名前")
        }

        guard let age = age else {
            return .emptyAge(section: "年齢(数字）")
        }

        guard let birthday = birthday, !birthday.isEmpty else {
            return .emptyBirthday(section: "誕生日")
        }

        return .valid
    }

}
