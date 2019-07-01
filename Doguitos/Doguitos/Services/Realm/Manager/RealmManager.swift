//
//  RealmManager.swift
//  Doguitos
//
//  Created by Samanta Clara Coutinho Rondon do Nascimento on 2019-06-30.
//  Copyright © 2019 Sam. All rights reserved.
//

import Foundation
import RealmSwift

class RealmManager {
    let realm = try? Realm()
    
    func saveObjc(obj: UserRealm) {
        try? realm!.write {
            realm?.add(obj, update: false)
        }
    }
    
    func deleteObj(obj: UserRealm) {
        try? realm!.write {
            realm!.delete(obj)
        }
    }
    
    func getObj() -> UserRealm? {
        let obj = realm!.objects(UserRealm.self)
        return obj.first
    }
}
