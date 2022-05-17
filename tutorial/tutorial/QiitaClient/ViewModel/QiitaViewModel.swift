//
//  QiitaViewModel.swift
//  tutorial
//
//  Created by 木元健太郎 on 2022/05/12.
//

import Foundation
import Moya
import RxCocoa
import RxMoya
import RxSwift

final class QiitaViewModel {

    var models = BehaviorRelay<[QiitaModel]>(value: [])
    private var disposeBag = DisposeBag()
    let provider = MoyaProvider<QiitaAPI>()

    func requestDataSource() {
        provider.rx.request(.user)
            .filterSuccessfulStatusCodes()
            .map([QiitaModel].self)
            .subscribe(onSuccess: { (response) in
                self.models.accept(response)
            }) { (error) in
                print(error)
            }
            .disposed(by: disposeBag)
    }
}
