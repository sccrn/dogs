//
//  ImageController.swift
//  Doguitos
//
//  Created by Samanta Clara Coutinho Rondon do Nascimento on 2019-07-01.
//  Copyright © 2019 Sam. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage

class ImageController: BaseController {
    @IBOutlet weak var dogImage: UIImageView!
    private var viewModel: ImagemViewModel
    
    init(viewModel: ImagemViewModel) {
        self.viewModel = viewModel
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadLayout()
    }
    
    private func loadLayout() {
        dogImage.sd_setImage(with: URL(string: viewModel.url), completed: { [weak self] image, error, cacheType, imageURL in
            self?.dogImage.image = image
        })
    }

    @IBAction func actionCloseImage(_ sender: Any) {
        viewModel.delegate?.moveToHomeScreen(controller: self)
    }
    
}
