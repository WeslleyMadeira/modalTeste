//
//  NetworkingService.swift
//  modalTeste
//
//  Created by Weslley Madeira on 24/01/20.
//  Copyright © 2020 Weslley Madeira. All rights reserved.
//

import RxSwift
import RxAlamofire
import Foundation


struct NetworkService {
    
   func load<T>(_ resource: SingleItemResource<T>) -> Observable<T> where T : Codable {
      return
        RxAlamofire
          .request(resource.action)
          .responseJSON()
          .map { $0.data }
          .filter { $0 != nil }
          .map { $0! }
          .flatMap(resource.parse)
    }
}
