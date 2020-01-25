//
//  BaseCoordinator.swift
//  modalTeste
//
//  Created by Weslley Madeira on 24/01/20.
//  Copyright © 2020 Weslley Madeira. All rights reserved.
//

import Foundation
import UIKit


protocol BaseCoordinator {
    var navigationController: UINavigationController { get set }
    func start()
}
