//
//  HomeCoordinator.swift
//  Doguitos
//
//  Created by Samanta Clara Coutinho Rondon do Nascimento on 2019-06-30.
//  Copyright © 2019 Sam. All rights reserved.
//

import Foundation
import UIKit

class HomeCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var rootViewController: UIViewController { return navigationController }
    
    private lazy var navigationController: UINavigationController = {
        let navigationController = UINavigationController()
        return navigationController
    }()
    
    func start() {
        
    }
}
