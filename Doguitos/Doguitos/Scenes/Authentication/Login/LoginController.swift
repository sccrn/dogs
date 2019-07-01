//
//  LoginController.swift
//  Doguitos
//
//  Created by Samanta Clara Coutinho Rondon do Nascimento on 2019-06-30.
//  Copyright © 2019 Sam. All rights reserved.
//

import Foundation
import UIKit

class LoginController: BaseController {
    @IBOutlet weak var emailTextField: UITextField!
    
    var viewModel: AuthViewModel = AuthViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadLayout()
    }
    
    private func loadLayout() {
        viewModel.delegate = self
    }
    
    @IBAction func actionLogin(_ sender: Any) {
        showLoading()
        viewModel.login(text: emailTextField.text)
    }
}

extension LoginController: AuthDelegate {
    func didEndAction(with state: AuthState) {
        switch state {
        case .success:
            stopLoading()
            viewModel.loginCoordinator?.moveForwardToHome(controller: self)
        case .error(let error):
            stopLoading()
            showError(err: error)
        }
    }
}
