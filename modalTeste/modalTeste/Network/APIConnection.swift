//
//  ApiRequests.swift
//  modalTeste
//
//  Created by Weslley Madeira on 24/01/20.
//  Copyright © 2020 Weslley Madeira. All rights reserved.
//

import Foundation
import Alamofire

protocol APIConnection: URLRequestConvertible {
  var method: HTTPMethod { get }
  var path: String { get }
  var actionParameters: [String: Any] { get }
  var baseURL: String { get }
  var authHeader: [String: String] { get }
  var encoding: ParameterEncoding { get }
}

extension APIConnection {
  var actionParameters: [String : Any] {
    return [:]
  }
  var authHeader: [String : String] {
    return [:]
  }
  var baseURL: String {
    return "https://api.github.com"
  }
}
