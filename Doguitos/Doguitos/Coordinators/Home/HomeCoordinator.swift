//
//  HomeCoordinator.swift
//  Doguitos
//
//  Created by Samanta Clara Coutinho Rondon do Nascimento on 2019-06-30.
//  Copyright © 2019 Sam. All rights reserved.
//

import Foundation
import UIKit

protocol HomeCoordinatorDelegate: class {
    func didEndFlow(coordinator: HomeCoordinator)
}

class HomeCoordinator: Coordinator {
    weak var delegate: HomeCoordinatorDelegate?
    var childCoordinators: [Coordinator] = []
    var rootViewController: UIViewController { return navigationController }
    
    private lazy var navigationController: UINavigationController = {
        let navigationController = UINavigationController()
        navigationController.setNavigationBarHidden(false, animated: true)
        navigationController.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController.navigationBar.barTintColor = .background
        navigationController.navigationBar.tintColor = .navColor
        return navigationController
    }()
    
    func start() {
        let homeScreen = HomeController()
        homeScreen.viewModel.coordinator = self
        navigationController.pushViewController(homeScreen, animated: false)
    }
}

extension HomeCoordinator: HomeVMCoordinatorDelegate {
    func moveToNextFlow(controller: HomeController, didSelect action: HomeAction) {
        switch action {
        case .logout: delegate?.didEndFlow(coordinator: self)
        case .imageZoom(let url):
            let viewModel = ImagemViewModel(url: url)
            viewModel.delegate = self
            let imageScreen = ImageController(viewModel: viewModel)
            navigationController.present(imageScreen, animated: true, completion: nil)
        }
    }
}

extension HomeCoordinator: ImageCoordinatorDelegate {
    func moveToHomeScreen(controller: ImageController) {
        controller.dismiss(animated: true, completion: nil)
    }
}
