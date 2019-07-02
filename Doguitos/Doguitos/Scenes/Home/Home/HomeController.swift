//
//  HomeController.swift
//  Doguitos
//
//  Created by Samanta Clara Coutinho Rondon do Nascimento on 2019-07-01.
//  Copyright © 2019 Sam. All rights reserved.
//

import Foundation
import UIKit

class HomeController: BaseController {
    @IBOutlet weak var tableView: UITableView!
    var viewModel: HomeViewModel = HomeViewModel()
    private var tableViewDataSource: HomeDataSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadLayout()
        loadNavBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        showLoading()
        viewModel.loadDogs()
    }
    
    private func loadNavBar() {
        navigationItem.title = Constants.Screen.home
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "logout"), style: .done, target: self, action: #selector(actionLogout))
    }
    
    @objc private func actionLogout() {
        showLoading()
        viewModel.logout()
    }
    
    private func loadLayout() {
        viewModel.delegate = self
        setupTableView()
    }
    
    private func setupTableView() {
        HomeDataSource.setupHomeTableView(tableView: tableView)
        tableViewDataSource = HomeDataSource(viewModel: viewModel)
        tableView.dataSource = tableViewDataSource
        tableView.delegate = tableViewDataSource
        tableView.backgroundColor = .background
    }
}

extension HomeController: HomeDelegate {
    func didEndAction(with state: HomeState) {
        switch state {
        case .success:
            stopLoading()
            tableView.reloadRows(at: [IndexPath(row: 1, section: 0)], with: .fade)
        case .error(let error):
            stopLoading()
            showError(err: error.localizedDescription)
        case .deleted:
            stopLoading()
            viewModel.coordinator?.moveToNextFlow(controller: self, didSelect: .logout)
        case .dogDetails(let url):
            viewModel.coordinator?.moveToNextFlow(controller: self, didSelect: .imageZoom(url: url))
        }
    }
}
