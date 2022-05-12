//
//  StandFMLiveListModel.swift
//  tutorial
//
//  Created by 木元健太郎 on 2022/05/09.
//

import UIKit

struct StandFMLiveListModel {
    
    let iconImage: UIImage?
    let liveTitle: String
    let channelName: String
    
    static func createModel() -> [StandFMLiveListModel] {
        return [
            StandFMLiveListModel(iconImage: UIImage(named: "fmImage1"), liveTitle: "片付けライブ", channelName: "私とジャンケンしてちょ"),
            StandFMLiveListModel(iconImage: UIImage(named: "fmImage2"), liveTitle: "筋トレしながら", channelName: "ひつじ　やど暮らしのライフコーチ"),
            StandFMLiveListModel(iconImage: UIImage(named: "fmImage3"), liveTitle: "『つながるチャンねる元気予報』ライブ", channelName: "『つながるチャンねる元気予報』"),
            StandFMLiveListModel(iconImage: UIImage(named: "fmImage4"), liveTitle: "新✨久保田チャンネル　ライブ", channelName: "新✨久保田チャンネル"),
            StandFMLiveListModel(iconImage: UIImage(named: "fmImage1"), liveTitle: "片付けライブ", channelName: "私とジャンケンしてちょ"),
            StandFMLiveListModel(iconImage: UIImage(named: "fmImage2"), liveTitle: "筋トレしながら", channelName: "ひつじ　やど暮らしのライフコーチ"),
            StandFMLiveListModel(iconImage: UIImage(named: "fmImage3"), liveTitle: "『つながるチャンねる元気予報』ライブ", channelName: "『つながるチャンねる元気予報』"),
            StandFMLiveListModel(iconImage: UIImage(named: "fmImage4"), liveTitle: "新✨久保田チャンネル　ライブ", channelName: "新✨久保田チャンネル")
        ]
    }
}
