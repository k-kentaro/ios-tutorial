//
//  UserDefaults.swift
//  tutorial
//
//  Created by 木元健太郎 on 2022/05/10.
//

import Foundation

extension UserDefaults {
    private var dataKey: String { "dataKey" }
    var data: String {
        get {
            self.string(forKey: dataKey) ?? ""
        }
        set {
            self.setValue(newValue, forKey: dataKey)
        }
    }
}
