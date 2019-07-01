//
//  AuthManager.swift
//  Doguitos
//
//  Created by Samanta Clara Coutinho Rondon do Nascimento on 2019-06-30.
//  Copyright © 2019 Sam. All rights reserved.
//

import Foundation
import Alamofire

class AuthManager {
    private lazy var apiManager: APIManager = {
       let manager = APIManager()
        return manager
    }()
    
    func login(email: String, completion:@escaping (Result<User>) -> Void) {
        apiManager.createRequest(route: API.login(email: email), completion: completion)
    }
}
