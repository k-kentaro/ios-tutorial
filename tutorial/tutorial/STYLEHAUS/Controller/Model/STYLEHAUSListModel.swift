//
//  ListModel.swift
//  tutorial
//
//  Created by 木元健太郎 on 2022/05/09.
//

import UIKit

struct STYLEHAUSListModel {
    
    let articleImage:UIImage?
    let articleText:String
    let articleCategory:String
    let writerName:String
    
    
    static func createModel() -> [STYLEHAUSListModel] {
        return [
            STYLEHAUSListModel(articleImage: UIImage(named: "STYLEHAUSimage1"), articleText: "《メンズにおすすめ》FENDI(フェンディ）のアクセサリーなら気品と華やかさを同時に出せる", articleCategory: "ACCESSORIES", writerName: "AyakoS"),
            STYLEHAUSListModel(articleImage: UIImage(named: "STYLEHAUSimage2"), articleText: "日常使いにも違和感なし！大人が持ちたいラグジュアリーなスポーツウォッチ", articleCategory: "WATCHES", writerName: "ICHI"),
            STYLEHAUSListModel(articleImage: UIImage(named: "STYLEHAUSimage3"), articleText: "ステータスを感じる長財布！メンズに人気のブランドランキングTOP10【BUYMAリアル調査】", articleCategory: "WALLET", writerName: "kensuke"),
            STYLEHAUSListModel(articleImage: UIImage(named: "STYLEHAUSimage1"), articleText: "《メンズにおすすめ》FENDI(フェンディ）のアクセサリーなら気品と華やかさを同時に出せる", articleCategory: "ACCESSORIES", writerName: "AyakoS"),
            STYLEHAUSListModel(articleImage: UIImage(named: "STYLEHAUSimage2"), articleText: "日常使いにも違和感なし！大人が持ちたいラグジュアリーなスポーツウォッチ", articleCategory: "WATCHES", writerName: "ICHI"),
            STYLEHAUSListModel(articleImage: UIImage(named: "STYLEHAUSimage3"), articleText: "ステータスを感じる長財布！メンズに人気のブランドランキングTOP10【BUYMAリアル調査】", articleCategory: "WALLET", writerName: "kensuke"),
            STYLEHAUSListModel(articleImage: UIImage(named: "STYLEHAUSimage1"), articleText: "《メンズにおすすめ》FENDI(フェンディ）のアクセサリーなら気品と華やかさを同時に出せる", articleCategory: "ACCESSORIES", writerName: "AyakoS"),
            STYLEHAUSListModel(articleImage: UIImage(named: "STYLEHAUSimage2"), articleText: "日常使いにも違和感なし！大人が持ちたいラグジュアリーなスポーツウォッチ", articleCategory: "WATCHES", writerName: "ICHI"),
            STYLEHAUSListModel(articleImage: UIImage(named: "STYLEHAUSimage3"), articleText: "ステータスを感じる長財布！メンズに人気のブランドランキングTOP10【BUYMAリアル調査】", articleCategory: "WALLET", writerName: "kensuke")
        ]
    }
}
