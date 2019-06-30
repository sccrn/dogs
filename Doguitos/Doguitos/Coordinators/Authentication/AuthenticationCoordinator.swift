//
//  AuthenticationCoordinator.swift
//  Doguitos
//
//  Created by Samanta Clara Coutinho Rondon do Nascimento on 2019-06-30.
//  Copyright © 2019 Sam. All rights reserved.
//

import Foundation
import UIKit

class AuthenticationCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var rootViewController: UIViewController { return navigationController }

    private lazy var navigationController: UINavigationController = {
        let navigationController = UINavigationController()
        navigationController.setNavigationBarHidden(true, animated: true)
        return navigationController
    }()

    func start() {
        let loginScreen = LoginController()
        loginScreen.viewModel.loginCoordinator = self
        navigationController.pushViewController(loginScreen, animated: false)
    }
}

extension AuthenticationCoordinator: LoginCoordinatorDelegate {
    func moveForwardToHome(controller: LoginController) {
        controller.dismiss(animated: false, completion: nil)
        childCoordinators.forEach { self.removeChildCoordinator($0) }
        
        let homeCoordinator = HomeCoordinator()
        homeCoordinator.start()
        addChildCoordinator(homeCoordinator)
        rootViewController.present(homeCoordinator.rootViewController, animated: false, completion: nil)
    }
}
