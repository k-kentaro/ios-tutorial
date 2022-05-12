//
//  Validation.swift
//  tutorial
//
//  Created by 木元健太郎 on 2022/05/10.
//

import Foundation


enum ValidationResult {
    case valid
    case nameIsEmpty(section: String)
    case ageIsEmpty(section: String)
    case birthdayIsEmpty(section: String)
    
    
    var isValid: Bool {
        switch self {
        case .valid:
            return true
        case .nameIsEmpty:
            return false
        case .ageIsEmpty:
            return false
        case .birthdayIsEmpty:
            return false
        }
    }
    
    var errorMessage: String {
        switch self {
        case .valid:
            return ""
        case .nameIsEmpty(let section):
            return "\(section)の入力がありません"
        case .ageIsEmpty(let section):
            return "\(section)の入力がありません"
        case .birthdayIsEmpty(let section):
            return "\(section)の入力がありません"
        }
    }
}

final class Validator {
    
    static let shared: Validator = .init()
    private init() {}
    
    func validationCheck(name: String?, age: Int?, birthday: String?) -> ValidationResult {
        
        guard let name = name, !name.isEmpty else {
            return .nameIsEmpty(section: "名前")
        }
        
        guard let age = age else {
            return .ageIsEmpty(section: "年齢(数字）")
        }
        
        guard let birthday = birthday, !birthday.isEmpty else {
            return .birthdayIsEmpty(section: "誕生日")
        }
        
        return .valid
    }
    
}
