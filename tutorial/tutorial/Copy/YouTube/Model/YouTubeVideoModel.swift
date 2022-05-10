//
//  Model.swift
//  tutorial
//
//  Created by 木元健太郎 on 2022/05/06.
//


import UIKit

struct YouTubeVideoModel {
    
    let thumbnail: UIImage?
    let icon: UIImage?
    let title: String
    let artistInfo: String
    
    static func createModel() -> [YouTubeVideoModel] {
        return [
            YouTubeVideoModel(thumbnail: UIImage(named: "YouTubeThumbnail1"), icon: UIImage(named: "YouTubeIcon"), title: "BE:FIRST/BetrayalGame-From Bye-Good-Bye One-day One Man Show-", artistInfo: "BE:FIRST Official 76万回視聴　1日前"),
            YouTubeVideoModel(thumbnail: UIImage(named: "YouTubeThumbnail2"), icon: UIImage(named: "YouTubeIcon"), title: "BE:FIRST/Shining One -Bye-Good-Bye One-day One Man Show-", artistInfo: "BE:FIRST Official 2796万回視聴　8ヶ月前")
        ]
    }
    
}

