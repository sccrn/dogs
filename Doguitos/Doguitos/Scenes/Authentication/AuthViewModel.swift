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

enum AuthState {
    case success
    case error(error: String)
}

protocol AuthDelegate: class {
    func didEndAction(with state: AuthState)
}

protocol SplashCoordinatorDelegate: class {
    func moveForward(controller: SplashController, didSelectFlow flow: AuthFlow)
}

protocol LoginCoordinatorDelegate: class {
    func moveForwardToHome(controller: LoginController)
}

class AuthViewModel {
    weak var delegate: AuthDelegate?
    weak var splashCoordinator: SplashCoordinatorDelegate?
    weak var loginCoordinator: LoginCoordinatorDelegate?
    
    private lazy var realmManager: RealmManager = {
        let manager = RealmManager()
        return manager
    }()
    
    private lazy var authManager: AuthManager = {
        let manager = AuthManager()
        return manager
    }()
    
    func setupFlow() -> AuthFlow {
        let user = realmManager.getObj()
        return user?.token.isEmpty ?? true ? .login : .home
    }
    
    func login(text: String?) {
        guard let email = text else {
            delegate?.didEndAction(with: .error(error: Constants.Error.mandatoryEmail))
            return
        }
        if !notValidate(email: email) {
            startLogin(email: email)
        }
    }
    
    private func startLogin(email: String) {
        authManager.login(email: email) { [weak self] result in
            switch result {
            case .success(let value):
                self?.saveToken(user: value, email: email)
            case .failure(let error):
                self?.delegate?.didEndAction(with: .error(error: error.localizedDescription))
            }
        }
    }
    
    private func saveToken(user: User, email: String) {
        let userRealm = UserRealm()
        userRealm.id = user.user._id
        userRealm.email = email
        userRealm.token = user.user.token
        realmManager.saveObjc(obj: userRealm)
        delegate?.didEndAction(with: .success)
    }
}

extension AuthViewModel {
    private func notValidate(email: String) -> Bool {
        if let error = Validator.isEmailValid(email: email) {
            delegate?.didEndAction(with: .error(error: error))
            return true
        }
        return false
    }
}
