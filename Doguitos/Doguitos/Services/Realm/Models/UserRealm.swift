//
//  User.swift
//  Doguitos
//
//  Created by Samanta Clara Coutinho Rondon do Nascimento on 2019-06-30.
//  Copyright © 2019 Sam. All rights reserved.
//

import Foundation
import RealmSwift

class UserRealm: Object {
    @objc dynamic var id: String = ""
    @objc dynamic var email: String = ""
    @objc dynamic var token: String = ""
    
    override static func primaryKey() -> String {
        return "id"
    }
}
