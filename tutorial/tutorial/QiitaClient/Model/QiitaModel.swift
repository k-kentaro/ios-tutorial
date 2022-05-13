//
//  QiitaModel.swift
//  tutorial
//
//  Created by 木元健太郎 on 2022/05/12.
//

import Foundation

struct QiitaModel: Decodable {
    var title: String?
    var user: User
    let url: String?
}

struct User: Decodable {
    var profile_image_url: String?
}
