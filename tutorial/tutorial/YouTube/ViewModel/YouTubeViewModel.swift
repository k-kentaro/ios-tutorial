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
    private var disposeBag = DisposeBag()
    let provider = MoyaProvider<HostingAPI>()

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
