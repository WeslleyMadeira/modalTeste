//
//  ApiActions.swift
//  modalTeste
//
//  Created by Weslley Madeira on 24/01/20.
//  Copyright © 2020 Weslley Madeira. All rights reserved.
//

import Foundation
import Alamofire

enum ApiRequest: APIConnection {
    
    case listRepositorys(language: String ,page: Int)
    
    var method: HTTPMethod {
        return .get
    }
    
    var path: String {
        switch self {
        case .listRepositorys(let languagem ,let page):
            return "/search/repositories?q=ios+language:\(languagem)&sort=stars&order=desc&order=desc&page=\(page)"
        }
    }
    
    var encoding: ParameterEncoding {
        return URLEncoding.default
    }
    
    func asURLRequest() throws -> URLRequest {
        let originalRequest = try URLRequest(url: baseURL.appending(path),
                                             method: method,
                                             headers: authHeader)
        let encodedRequest = try encoding.encode(originalRequest,
                                                 with: actionParameters)
        return encodedRequest
    }
}
