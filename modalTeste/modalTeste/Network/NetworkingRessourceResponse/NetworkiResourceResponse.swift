//
//  NetworkiResourceResponse.swift
//  modalTeste
//
//  Created by Weslley Madeira on 24/01/20.
//  Copyright © 2020 Weslley Madeira. All rights reserved.
//

import Foundation
import RxSwift

struct CustomError: Error {
    var messagem: String
}

struct SingleItemResource<T: Codable> {
  let objectType = T.self
  let action: APIConnection

  func parse(_ data: Data) -> Observable<T> {
    return Observable.create { observer in
        do {
            let result = try JSONDecoder().decode(T.self, from: data)
        } catch {
            print(error)
        }
      guard let result = try? JSONDecoder().decode(T.self, from: data) else {
        observer.onError(CustomError(messagem: "Error"))
        return Disposables.create()
      }
      observer.onNext(result)
      return Disposables.create()
    }
  }
}
