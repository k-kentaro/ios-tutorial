//
//  QiitaAPI.swift
//  tutorial
//
//  Created by 木元健太郎 on 2022/05/12.
//

import Foundation
import Moya
import RxSwift


enum QiitaError: Error {
    case error
}

enum QiitaAPI {
    case user
}

extension QiitaAPI: TargetType {
    var baseURL: URL {
        guard let url = URL(string: "https://qiita.com/api/v2/tags/iOS/items") else {
            fatalError("base URL error")
        }
        return url
    }
    
    var path: String {
        switch self {
        case .user:
            return ""
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
    
    var headers: [String : String]? {
        return nil
    }
    
    
    func get(success: (([QiitaModel]) -> Void)? = nil, error: ((Error)->Void)? = nil) {
        
        let provider = MoyaProvider<QiitaAPI>()
        provider.request(.user){ result in
            print(result)
            switch result {
            case.success(let response):
                let data = response.data
                guard  let QiitaResponse = try? JSONDecoder().decode([QiitaModel].self, from: data) else {
                    success?([])
                           return
                       }
                success?(QiitaResponse)
            case.failure(let err):
                error?(err)
            }
        }
    }
}

extension QiitaAPI: ReactiveCompatible {}
extension Reactive where Base == QiitaAPI {
    func get() -> Observable<[QiitaModel]> {
        return Observable.create { observer in
            QiitaAPI.user.get(
            success: { (models) in
            observer.on(.next(models))
          }, error: { err in
            observer.on(.error(err))
          })
          return Disposables.create()
        }.share(replay: 1, scope: .whileConnected)
      }
}
