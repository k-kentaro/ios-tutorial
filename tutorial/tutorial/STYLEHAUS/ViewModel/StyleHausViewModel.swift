//
//  StyleHausViewModel.swift
//  tutorial
//
//  Created by 木元健太郎 on 2022/05/18.
//

import Foundation
import Moya
import RxCocoa
import RxMoya
import RxSwift

final class StyleHausViewModel {

    var models = BehaviorRelay<[StyleHausListModel]>(value: [])
    private var disposeBag = DisposeBag()
    let provider = MoyaProvider<HostingAPI>()

    func requestDataSource() {
        provider.rx.request(.stylehaus)
            .filterSuccessfulStatusCodes()
            .map([StyleHausListModel].self)
            .subscribe(onSuccess: { (response) in
                self.models.accept(response)
            }) { (error) in
                print(error)
            }
            .disposed(by: disposeBag)
    }
}
