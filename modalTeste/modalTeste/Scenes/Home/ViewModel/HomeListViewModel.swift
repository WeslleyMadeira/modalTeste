//
//  HomeListViewModel.swift
//  modalTeste
//
//  Created by Weslley Madeira on 24/01/20.
//  Copyright © 2020 Weslley Madeira. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa


protocol HomeListViewModelType: class {
    
    var service: NetworkService {get}
    
}

class HomeListViewModel: HomeListViewModelType {
    
    var service: NetworkService
    
    private let gitRepositories = BehaviorRelay<[Repository]>(value: [])
    private let requestPage = BehaviorRelay<Int>(value: 1)
    var checkBootomView = PublishSubject<Void>()
    
    var isLoading = BehaviorRelay<Bool>(value: true)
    
    var disposBag = DisposeBag()
    var repositorysDriver: SharedSequence< DriverSharingStrategy,[Repository]> {
        return gitRepositories.asDriver(onErrorJustReturn: [])
    }
    
    init(service: NetworkService) {
        self.service = service
        
        requestRepositorties()
        bindData()
    }
    
    func bindData() {
        checkBootomView.subscribe(onNext: { [weak self] in
            guard let `self` = self else {return}
            if !self.isLoading.value {
                self.isLoading.accept(true)
                self.requestPage.accept( self.requestPage.value + 1 )
                self.requestRepositorties()
            }
        }).disposed(by: disposBag)
    }
    
    func requestRepositorties() {
        service.load(SingleItemResource<RepositoriesResponse>(action: ApiRequest.listRepositorys(language: "Swift", page: requestPage.value)))
            .map {
                $0.items
        }.subscribe(onNext: { (repositories) in
            self.gitRepositories.accept(self.gitRepositories.value + repositories)
            self.isLoading.accept(false)
        }, onError: { (error) in
            self.requestPage.accept( self.requestPage.value - 1 )
        }).disposed(by: disposBag)
        
    }
}
