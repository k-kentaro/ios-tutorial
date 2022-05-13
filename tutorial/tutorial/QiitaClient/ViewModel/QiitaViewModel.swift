//
//  QiitaViewModel.swift
//  tutorial
//
//  Created by 木元健太郎 on 2022/05/12.
//

import Foundation
import RxSwift
import RxCocoa
import NSObject_Rx

//ViewModelの入力に関するprotocol
protocol QiitaViewModelInput {
}

//ViewModelの出力に関するprotocol
protocol QiitaViewModelOutput {
  var changeModelsObservable: Observable<Void> { get }
  var models: [QiitaModel] { get }
}

//ViewModelはInputとOutputのprotocolに準拠する
final class QiitaViewModel: QiitaViewModelInput,QiitaViewModelOutput,HasDisposeBag {

  private let _changeModelsObservable = PublishRelay<Void>()
  lazy var changeModelsObservable = _changeModelsObservable.asObservable()
  //最後に取得したデータ
  private(set) var models: [QiitaModel] = []

  //初期化時にストリームを決める
  init() {
      Observable.combineLatest.flatMapLatest( {Observable<[QiitaModel]> in
          QiitaAPI.rx.get()}).map {[weak self](models) -> Void in
        //最後に得たデータを保存
        self?.models = models
        //値が更新したことを告げるためだけのストリームを流すのでVoidにする
        return
      }.bind(to: _changeModelsObservable).disposed(by: disposeBag)
      }
  }



