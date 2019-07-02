//
//  ImageZoomViewModel.swift
//  Doguitos
//
//  Created by Samanta Clara Coutinho Rondon do Nascimento on 2019-07-01.
//  Copyright © 2019 Sam. All rights reserved.
//

import Foundation

protocol ImageCoordinatorDelegate: class {
    func moveToHomeScreen(controller: ImageController)
}

class ImagemViewModel {
    weak var delegate: ImageCoordinatorDelegate?
    var url: String
    
    init(url: String) {
        self.url = url
    }
}
