//
//  MCUViewModel.swift
//  tutorial
//
//  Created by 木元健太郎 on 2022/05/23.
//

import Foundation
import Moya
import RealmSwift
import RxCocoa
import RxMoya
import RxSwift
import UIKit

final class MCUViewModel {
    
    private let realm = try! Realm()
    private let provider = MoyaProvider<MCUAPI>()
    private var deleteItem = BehaviorRelay<MCUData>(value: MCUData())
    private var responseModel: [MCUData] = []
    private var disposeBag = DisposeBag()
    private var catchDataDelegate: CatchDataProtocol?
    private var responseSaveData:[MCUData] = []
    var movieModels = BehaviorRelay<[MCUData]>(value: [])
    var dramaModels = BehaviorRelay<[MCUData]>(value: [])
    var detailModels = BehaviorRelay<MCUData>(value: MCUData())
    var favoriteDataModel = BehaviorRelay<[MCUData]>(value: [])
    var isAnimating = BehaviorRelay(value: false)
    var isCellEmpty = BehaviorRelay(value: false)
    var isFavorite:[Bool] = []
    
    //インジケーターの関数
    private func showIndicator() {
        isAnimating.accept(true)
    }
    
    private func hiddenIndicator() {
        isAnimating.accept(false)
    }
    
    private func showBackImage() {
        isCellEmpty.accept(true)
    }
    
    private func hiddenBackImage() {
        isCellEmpty.accept(false)
    }
    
    //APIから映画のリストを取得
    func requestMovieData() {
        showIndicator()
        provider.rx.request(.movie)
            .filterSuccessfulStatusCodes()
            .map(MCUModel.self)
            .subscribe(onSuccess: { (response) in
                let responseData = response.data
                self.movieModels.accept(responseData)
                self.hiddenIndicator()
            }) { (error) in
                print(error)
            }
            .disposed(by: disposeBag)
    }
    
    //APIからドラマのリストを取得
    func requestDramaData() {
        provider.rx.request(.drama)
            .filterSuccessfulStatusCodes()
            .map(MCUModel.self)
            .subscribe(onSuccess: { (response) in
                let responseData = response.data
                self.dramaModels.accept(responseData)
            }) { (error) in
                print(error)
            }
            .disposed(by: disposeBag)
    }
    
    //映画の詳細を取得
    func getMovieDetailData(row: Int) {
        showIndicator()
        provider.rx.request(.movie)
            .filterSuccessfulStatusCodes()
            .map(MCUModel.self)
            .subscribe(onSuccess: { [weak self] (response) in
                guard let self = self else { return }
                self.responseModel = response.data
                guard let title = self.responseModel[row].title,
                      let releaseDate = self.responseModel[row].releaseDate,
                      let overView = self.responseModel[row].overview,
                      let coverUrl = self.responseModel[row].coverUrl,
                      let trailerUrl = self.responseModel[row].trailerUrl,
                      let phase = self.responseModel[row].phase,
                      let saga = self.responseModel[row].saga else {
                    return
                }
                let data = MCUData(title: title, releaseDate: releaseDate, overview: overView, coverUrl: coverUrl, trailerUrl: trailerUrl, phase: phase, saga: saga)
                self.detailModels.accept(data)
                self.hiddenIndicator()
            }) { (error) in
                print(error)
            }
            .disposed(by: disposeBag)
    }
    
    //ドラマの詳細を取得
    func getDramaDetailData(row: Int) {
        showIndicator()
        provider.rx.request(.drama)
            .filterSuccessfulStatusCodes()
            .map(MCUModel.self)
            .subscribe(onSuccess: { [weak self] (response) in
                guard let self = self else { return }
                self.responseModel = response.data
                guard let title = self.responseModel[row].title,
                      let releaseDate = self.responseModel[row].releaseDate,
                      let overView = self.responseModel[row].overview,
                      let coverUrl = self.responseModel[row].coverUrl,
                      let trailerUrl = self.responseModel[row].trailerUrl else {
                    return
                }
                let data = MCUData(title: title, releaseDate: releaseDate, overview: overView, coverUrl: coverUrl, trailerUrl: trailerUrl)
                self.detailModels.accept(data)
                self.hiddenIndicator()
            }) { (error) in
                print(error)
            }
            .disposed(by: disposeBag)
    }
    
    //お気に入りアイテムの詳細を取得
    func getFavoriteDetailData(row: Int) {
        showIndicator()
        favoriteDataModel.bind(onNext: { [weak self] response in
            guard let self = self else { return }
            if response.count == 0,
               response.count >= row {
                return
            }
            //ここで配列に代入
            self.responseSaveData = response
        }).disposed(by: disposeBag)
        let title = responseSaveData[row].title
        let releaseDate = responseSaveData[row].releaseDate
        let overView = responseSaveData[row].overview
        let coverUrl = responseSaveData[row].coverUrl
        let trailerUrl = responseSaveData[row].trailerUrl
        let data = MCUData(title: title, releaseDate: releaseDate, overview: overView, coverUrl: coverUrl, trailerUrl: trailerUrl)
        detailModels.accept(data)
        self.hiddenIndicator()
    }
    
    //映画リストからお気に入り確認&保存する関数
    func checkSaveMovie(row: Int) {
        provider.rx.request(.movie)
            .filterSuccessfulStatusCodes()
            .map(MCUModel.self)
            .subscribe(onSuccess: { [weak self] (response) in
                guard let self = self else { return }
                self.responseModel = response.data
                guard let title = self.responseModel[row].title else {
                    return
                }
                let realm = try! Realm()
                let favoriteDataModel = FavoriteDataModel()
                favoriteDataModel.favoriteTitle = title
                let filterTitle = realm.objects(FavoriteDataModel.self).filter("favoriteTitle == %d",title)
                if filterTitle.count == 0 {
                    favoriteDataModel.isFavorite = true
                    try! realm.write {
                        realm.add(favoriteDataModel)
                        print("保存完了")
                        print(favoriteDataModel)
                    }
                } else {
                    
                    favoriteDataModel.isFavorite = false
                    try! realm.write {
                        realm.delete(filterTitle)
                        print("削除完了")
                        print(favoriteDataModel)
                    }
                }
            }) { (error) in
                print(error)
            }
            .disposed(by: disposeBag)
    }
    
    //ドラマリストからお気に入り状態確認&保存する関数
    func checkSaveDrama(row: Int) {
        provider.rx.request(.drama)
            .filterSuccessfulStatusCodes()
            .map(MCUModel.self)
            .subscribe(onSuccess: { [weak self] (response) in
                guard let self = self else { return }
                self.responseModel = response.data
                guard let title = self.responseModel[row].title else {
                    return
                }
                let realm = try! Realm()
                let favoriteDataModel = FavoriteDataModel()
                favoriteDataModel.favoriteTitle = title
                //タイトルが同じものがあるか照合
                let filterTitle = realm.objects(FavoriteDataModel.self).filter("favoriteTitle == %d",title)
                if filterTitle.count == 0 {
                    favoriteDataModel.isFavorite = true
                    try! realm.write {
                        realm.add(favoriteDataModel)
                    }
                } else {
                    favoriteDataModel.isFavorite = false
                    try! realm.write {
                        realm.delete(filterTitle)
                    }
                }
            }) { (error) in
                print(error)
            }
            .disposed(by: disposeBag)
    }
    
    //映画リストのお気に入り状態をチェックするだけの関数
    func checkFavoriteStateMovie(row: Int) {
        isFavorite = []
        provider.rx.request(.movie)
            .filterSuccessfulStatusCodes()
            .map(MCUModel.self)
            .subscribe(onSuccess: { [weak self] (response) in
                guard let self = self else { return }
                self.responseModel = response.data
                guard let title = self.responseModel[row].title else {
                    return
                }
                let filterTitle = self.realm.objects(FavoriteDataModel.self).filter("favoriteTitle == %d",title)
                if filterTitle.count == 0 {
                    self.isFavorite.append(false)
                    print("お気に入りじゃない")
                } else {
                    self.isFavorite.append(true)
                    print("お気に入りです")
                }
            }
            ) { (error) in
                print(error)
            }
            .disposed(by: disposeBag)
    }
    
    //ドラマリストのお気に入り状態をチェックするだけの関数
    func checkFavoriteStateDrama(row: Int) {
        isFavorite = []
        provider.rx.request(.drama)
            .filterSuccessfulStatusCodes()
            .map(MCUModel.self)
            .subscribe(onSuccess: { [weak self] (response) in
                guard let self = self else { return }
                self.responseModel = response.data
                guard let title = self.responseModel[row].title else {
                    return
                }
                let filterTitle = self.realm.objects(FavoriteDataModel.self).filter("favoriteTitle == %d",title)
                if filterTitle.count == 0 {
                    self.isFavorite.append(false)
                } else {
                    self.isFavorite.append(true)
                }
            }
            ) { (error) in
                print(error)
            }
            .disposed(by: disposeBag)
    }
    
    //お気に入りリストをチェックして保存or削除する関数
    func checkFavoriteList(row: Int) {
        favoriteDataModel.asObservable().subscribe(onNext: { [weak self] response in
            guard let self = self else { return }
            if response.count == 0,
               response.count >= row {
                return
            }
            //ここで空の配列に代入
            self.responseSaveData = response
        }).disposed(by: disposeBag)
        
        guard let title = responseSaveData[row].title else {
            return
        }
        let realm = try! Realm()
        let favoriteDataModel = FavoriteDataModel()
        favoriteDataModel.favoriteTitle = title
        //タイトルが同じものがあるか照合
        let filterTitle = realm.objects(FavoriteDataModel.self).filter("favoriteTitle == %d",title)
        if filterTitle.count == 0 {
            favoriteDataModel.isFavorite = true
            try! realm.write {
                realm.add(filterTitle)
                requestFavoriteData()
            }
        } else {
            favoriteDataModel.isFavorite = false
            try! realm.write {
                realm.delete(filterTitle)
                requestFavoriteData()
            }
        }
    }
    
    //お気に入りを取得してマージする
    func requestFavoriteData() {
        let movieObservable = Observable<[MCUData]>.create { [self] observer -> Disposable in
            showIndicator()
            provider.rx.request(.movie)
                .filterSuccessfulStatusCodes()
                .map(MCUModel.self)
                .subscribe(onSuccess: { [self] (response) in
                    let responseData = response.data
                    //配列に変換
                    let favoriteDataArray = Array(realm.objects(FavoriteDataModel.self))
                    let favoriteData = favoriteDataArray.map { $0.favoriteTitle }
                    let filterData = responseData.filter { favoriteData.contains($0.title) }
                    observer.onNext(filterData)
                    observer.onCompleted()
                }) { (error) in
                    print(error)
                }
                .disposed(by: disposeBag)
            return Disposables.create()
        }
        
        let dramaObservable =  Observable<[MCUData]>.create { [self] observer -> Disposable in
            provider.rx.request(.drama)
                .filterSuccessfulStatusCodes()
                .map(MCUModel.self)
                .subscribe(onSuccess: { [self] (response) in
                    let responseData = response.data
                    //配列に変換
                    let favoriteDataArray = Array(realm.objects(FavoriteDataModel.self))
                    let favoriteData = favoriteDataArray.map { $0.favoriteTitle }
                    let filterData = responseData.filter { favoriteData.contains($0.title) }
                    observer.onNext(filterData)
                    observer.onCompleted()
                }) { (error) in
                    print(error)
                }
                .disposed(by: disposeBag)
            return Disposables.create()
        }
        
        Observable.combineLatest(movieObservable,dramaObservable).map{ [self] movie,drama in
            //データを合成
            let mcuMix = movie + drama
            //データがあれば、BackImageを隠す
            if mcuMix.count == 0 {
                showBackImage()
            } else {
                hiddenBackImage()
            }
            favoriteDataModel.accept(mcuMix)
            hiddenIndicator()
        }.subscribe().disposed(by: disposeBag)
    }
}
