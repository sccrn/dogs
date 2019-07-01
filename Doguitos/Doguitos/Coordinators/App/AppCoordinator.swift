//
//  AppCoordinator.swift
//  Doguitos
//
//  Created by Samanta Clara Coutinho Rondon do Nascimento on 2019-06-30.
//  Copyright © 2019 Sam. All rights reserved.
//

import Foundation
import UIKit

class AppCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var rootViewController: UIViewController { return navigationController }
    
    private lazy var navigationController: UINavigationController = {
        let navigationController = UINavigationController()
        navigationController.setNavigationBarHidden(true, animated: true)
        return navigationController
    }()
    
    let window: UIWindow?
    
    public init(window: UIWindow?) {
        self.window = window
        self.window?.rootViewController = self.rootViewController
        self.window?.makeKeyAndVisible()
    }
    
    func start() {
        let splashScreen = SplashController()
        splashScreen.viewModel.splashCoordinator = self
        rootViewController.present(splashScreen, animated: false, completion: nil)
    }
    
    private func setupHomeFlow() {
        let homeCoordinator = HomeCoordinator()
        homeCoordinator.start()
        homeCoordinator.delegate = self
        addChildCoordinator(homeCoordinator)
        rootViewController.present(homeCoordinator.rootViewController, animated: false, completion: nil)
    }
    
    private func setupAuthFlow() {
        let authCoordinator = AuthenticationCoordinator()
        authCoordinator.start()
        authCoordinator.delegate = self
        addChildCoordinator(authCoordinator)
        rootViewController.present(authCoordinator.rootViewController, animated: false, completion: nil)
    }
}

extension AppCoordinator: SplashCoordinatorDelegate {
    func moveForward(controller: SplashController, didSelectFlow flow: AuthFlow) {
        controller.dismiss(animated: false, completion: nil)
        childCoordinators.forEach { self.removeChildCoordinator($0) }
        
        switch flow {
        case .login: setupAuthFlow()
        case .home: setupHomeFlow()
        }
    }
}

extension AppCoordinator: AuthenticationDelegate {
    func didEndFlow(coordinator: AuthenticationCoordinator) {
        coordinator.rootViewController.dismiss(animated: false)
        self.removeChildCoordinator(coordinator)
        setupHomeFlow()
    }
}

extension AppCoordinator: HomeCoordinatorDelegate {
    func didEndFlow(coordinator: HomeCoordinator) {
        coordinator.rootViewController.dismiss(animated: false)
        self.removeChildCoordinator(coordinator)
        setupAuthFlow()
    }
}
