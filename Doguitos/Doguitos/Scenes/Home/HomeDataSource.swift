//
//  HomeDataSource.swift
//  Doguitos
//
//  Created by Samanta Clara Coutinho Rondon do Nascimento on 2019-07-01.
//  Copyright © 2019 Sam. All rights reserved.
//

import Foundation
import UIKit

class HomeDataSource: NSObject {
    private var viewModel: HomeViewModel
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
    }
}

extension HomeDataSource: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch viewModel.typeOfCell(for: indexPath.row) {
        case .general:
            let cell = tableView.dequeue(cellClass: GeneralCell.self, indexPath: indexPath)
            cell.delegate = self
            return cell
        case .category:
            let cell = tableView.dequeue(cellClass: CategoryCell.self, indexPath: indexPath)
            cell.configure(dogs: viewModel.dogs)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension HomeDataSource {
    class func setupHomeTableView(tableView: UITableView?) {
        tableView?.registerNib(cellClass: GeneralCell.self)
        tableView?.registerNib(cellClass: CategoryCell.self)
    }
}

extension HomeDataSource: GeneralCellDelegate {
    func didSelect(breed: DogBreeds) {
        viewModel.changeDogBreed(breed: breed)
    }
}
