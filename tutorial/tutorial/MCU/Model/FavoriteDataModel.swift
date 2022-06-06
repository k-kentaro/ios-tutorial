//
//  FavoriteDataModel.swift
//  tutorial
//
//  Created by 木元健太郎 on 2022/05/25.
//

import Foundation
import RealmSwift

class FavoriteDataModel: Object {
    @objc dynamic var favoriteId: Int = 0
    @objc dynamic var favoriteTitle: String?
    @objc dynamic var favoriteReleaseDate: String?
    @objc dynamic var favoriteOverview: String?
    @objc dynamic var favoriteCoverUrl: String?
    @objc dynamic var favoriteTrailerUrl: String?
    @objc dynamic var favoritePhase: Int = 0
    @objc dynamic var favoriteSaga: String?
    @objc dynamic var favoriteChronology: Int = 0
    @objc dynamic var isFavorite: Bool = false
}
