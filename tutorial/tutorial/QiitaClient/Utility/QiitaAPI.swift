//
//  QiitaAPI.swift
//  tutorial
//
//  Created by 木元健太郎 on 2022/05/12.
//

import Foundation
import Moya

enum QiitaError: Error {
    case error
}

enum QiitaAPI {
    case user
}

extension QiitaAPI: TargetType {
    var baseURL: URL {
        guard let url = URL(string: "https://qiita.com/api/v2/") else {
            fatalError("base URL error")
        }
        return url
    }

    var path: String {
        switch self {
        case .user:
            return "tags/\(QiitaSearchTag.tag)/items"
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
