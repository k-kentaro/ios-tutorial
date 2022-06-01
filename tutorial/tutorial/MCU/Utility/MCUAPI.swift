//
//  MCUAPI.swift
//  tutorial
//
//  Created by 木元健太郎 on 2022/05/23.
//

import Foundation
import Moya

enum MCUAPIError: Error {
    case error
}

enum MCUAPI {
    case movie
    case drama
}

extension MCUAPI: TargetType {
    var baseURL: URL {
        guard let url = URL(string: "https://mcuapi.herokuapp.com/api/v1/") else {
            fatalError("base URL error")
        }
        return url
    }

    var path: String {
        switch self {
        case .movie:
            return "movies"
        case .drama:
            return "tvshows"
        }
    }

    var method: Moya.Method {
        return Moya.Method.get
    }

    var sampleData: Data {
        return Data()
    }

    var task: Task {
        return .requestPlain
    }

    var headers: [String: String]? {
        return nil
    }
}
