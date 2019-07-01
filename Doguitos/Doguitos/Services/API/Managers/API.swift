//
//  API.swift
//  Doguitos
//
//  Created by Samanta Clara Coutinho Rondon do Nascimento on 2019-06-30.
//  Copyright © 2019 Sam. All rights reserved.
//

import Foundation
import Alamofire

///This is the enum that we're gonna use to not repeat code in our requests.
enum API: URLRequestConvertible {
    case login(email: String)
    case feed
    
    private var method: HTTPMethod {
        switch self {
        case .login: return .post
        case .feed: return .get
        }
    }
    
    private var path: String {
        switch self {
        case .login: return Constants.Service.signup
        case .feed: return Constants.Service.feed
        }
    }
    
    var parameters: Parameters? {
        switch self {
        case .login(let email):
            return [Constants.Service.email: email]
        case .feed: return nil
        }
    }
    
    ///Here, we will get from this function our urlRequest exactly the type that we need.
    func asURLRequest() throws -> URLRequest {
        let url = try Constants.Service.baseURL.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        urlRequest.httpMethod = method.rawValue
        
        urlRequest.setValue(Constants.Service.json, forHTTPHeaderField: Constants.Service.acceptType)
        urlRequest.setValue(Constants.Service.json, forHTTPHeaderField: Constants.Service.contentType)
        
        if let parameters = parameters {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
        
        return urlRequest
    }
}

