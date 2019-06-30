//
//  AuthViewModel.swift
//  Doguitos
//
//  Created by Samanta Clara Coutinho Rondon do Nascimento on 2019-06-30.
//  Copyright © 2019 Sam. All rights reserved.
//

import Foundation
import UIKit

enum AuthFlow {
    case login, home
}

protocol SplashCoordinatorDelegate: class {
    func moveForward(controller: SplashController, didSelectFlow flow: AuthFlow)
}

protocol LoginCoordinatorDelegate: class {
    func moveForwardToHome(controller: LoginController)
}

class AuthViewModel {
    weak var splashCoordinator: SplashCoordinatorDelegate?
    weak var loginCoordinator: LoginCoordinatorDelegate?
    
    private lazy var realmManager: RealmManager = {
        let manager = RealmManager()
        return manager
    }()
    
    func setupFlow() -> AuthFlow {
        guard let _  = realmManager.getObj() else {
            return .login
        }
        return .home
    }
}
