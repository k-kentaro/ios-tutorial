//
//  MCUModel.swift
//  tutorial
//
//  Created by 木元健太郎 on 2022/05/23.
//

import Foundation

struct MCUModel: Codable {
    var data: [MCUData]
}

struct MCUData: Codable {
    var id: Int?
    var title: String?
    var releaseDate: String?
    var overview: String?
    var coverUrl: String?
    var trailerUrl: String?
    var phase: Int?
    var saga: String?
    var chronology: Int?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case releaseDate = "release_date"
        case overview = "overview"
        case coverUrl = "cover_url"
        case trailerUrl = "trailer_url"
        case phase = "phase"
        case saga = "saga"
        case chronology = "chronology"
    }
}
