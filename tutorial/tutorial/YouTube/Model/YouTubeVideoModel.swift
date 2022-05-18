//
//  Model.swift
//  tutorial
//
//  Created by 木元健太郎 on 2022/05/06.
//

import UIKit

struct YouTubeVideoModel: Decodable {
    let thumbnail: String?
    let icon: String?
    let title: String?
    let artistInfo: String?
}
