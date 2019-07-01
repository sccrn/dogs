//
//  DogsManager.swift
//  Doguitos
//
//  Created by Samanta Clara Coutinho Rondon do Nascimento on 2019-06-30.
//  Copyright © 2019 Sam. All rights reserved.
//

import Foundation
import Alamofire

class DogsManager {
    private lazy var apiManager: APIManager = {
        let manager = APIManager()
        return manager
    }()
    
    func fetchDogs(by breed: DogBreeds, completion:@escaping (Result<Dogs>) -> Void) {
        apiManager.createRequest(route: API.feed(breed: breed.rawValue), completion: completion)
    }
}
