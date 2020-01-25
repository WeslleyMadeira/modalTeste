//
//  HomeListCoordinator.swift
//  modalTeste
//
//  Created by Weslley Madeira on 24/01/20.
//  Copyright © 2020 Weslley Madeira. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class HomeListCoordinator {
    
    private weak var navigationController: UINavigationController?

    private let disposeBag = DisposeBag()
    
    func start() -> (controller: HomeListViewController,viewModel: HomeListViewModel ) {
        let service = NetworkService()
        let viewModel = HomeListViewModel(service: service)
        let controller = HomeListViewController()
        controller.viewModel = viewModel
        return (controller,viewModel)
    }
}
