//
//  HostingAPI.swift
//  tutorial
//
//  Created by 木元健太郎 on 2022/05/18.
//

import Foundation
import Moya

enum HostingAPIError: Error {
    case error
}

enum HostingAPI {
    case youtube
    case stylehaus
    case standfm
}

extension HostingAPI: TargetType {
    var baseURL: URL {
        guard let url = URL(string: "https://tutorial6-d543b.web.app/api/v1/") else {
            fatalError("base URL error")
        }
        return url
    }

    var path: String {
        switch self {
        case .youtube:
            return "YouTube/YouTube.json"
        case .stylehaus:
            return "STYLEHAUS/STYLEHAUS.json"
        case .standfm:
            return "standFM/standFM.json"
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
