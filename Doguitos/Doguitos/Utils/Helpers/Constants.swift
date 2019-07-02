//
//  Constants.swift
//  Doguitos
//
//  Created by Samanta Clara Coutinho Rondon do Nascimento on 2019-06-30.
//  Copyright © 2019 Sam. All rights reserved.
//

import Foundation

struct Constants {
    struct Service {
        static let baseURL = "https://api-iddog.idwall.co/"
        static let signup = "signup"
        static let feed = "feed"
        static let email = "email"
        static let category = "category"
        
        static let acceptType = "Accept"
        static let contentType = "Content-Type"
        static let authorization = "Authorization"
        static let acceptEnconding = "Accept-Enconding"
        static let json = "application/json"
    }
    
    struct Screen {
        static let home = "Home"
    }
    
    struct Error {
        static let mandatoryEmail = "Email is mandatory"
        static let invalidEmail = "Invalid email"
    }
}
