//
//  User.swift
//  Doguitos
//
//  Created by Samanta Clara Coutinho Rondon do Nascimento on 2019-06-30.
//  Copyright © 2019 Sam. All rights reserved.
//

import Foundation

struct User: Codable {
    let user: UserCodable
}

struct UserCodable: Codable {
    let _id: String
    let token: String
    let createdAt: String
    let updatedAt: String
    let __v: Int
}
