//
//  SplashController.swift
//  Doguitos
//
//  Created by Samanta Clara Coutinho Rondon do Nascimento on 2019-06-30.
//  Copyright © 2019 Sam. All rights reserved.
//

import Foundation
import UIKit

class SplashController: BaseController {
    @IBOutlet weak var loading: UIActivityIndicatorView!
    
    var viewModel: AuthViewModel = AuthViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSplash()
    }
    
    private func setupSplash() {
        loading.startAnimating()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
            self.loading.stopAnimating()
            
            let flow = self.viewModel.setupFlow()
            self.viewModel.splashCoordinator?.moveForward(controller: self, didSelectFlow: flow)
        })
    }
}
