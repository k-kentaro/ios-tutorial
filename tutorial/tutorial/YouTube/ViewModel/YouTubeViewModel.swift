//
//  YouTubeViewModel.swift
//  tutorial
//
//  Created by 木元健太郎 on 2022/05/18.
//

import Foundation
import Moya
import RxCocoa
import RxMoya
import RxSwift

final class YouTubeViewModel {

    var models = BehaviorRelay<[YouTubeVideoModel]>(value: [])
    let provider = MoyaProvider<HostingAPI>()
    private var disposeBag = DisposeBag()

    func requestDataSource() {
        provider.rx.request(.youtube)
            .filterSuccessfulStatusCodes()
            .map([YouTubeVideoModel].self)
            .subscribe(onSuccess: { (response) in
                self.models.accept(response)
            }) { (error) in
                print(error)
            }
            .disposed(by: disposeBag)
    }
}
