//
//  QiitaModel.swift
//  tutorial
//
//  Created by 木元健太郎 on 2022/05/12.
//

import Foundation

struct QiitaModel: Decodable {
    var title: String?
    var user: QiitaUser
    let url: String?
}

struct QiitaUser: Decodable {
    var profileImageUrl: String?

    enum CodingKeys: String, CodingKey {
        case profileImageUrl = "profile_image_url"
    }
}
