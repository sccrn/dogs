//
//  HomeViewModel.swift
//  Doguitos
//
//  Created by Samanta Clara Coutinho Rondon do Nascimento on 2019-07-01.
//  Copyright © 2019 Sam. All rights reserved.
//

import Foundation

enum HomeCell: CaseIterable {
    case general, category
}

enum HomeState {
    case success
    case error(error: Error)
    case deleted
    case dogDetails(url: String)
}

enum HomeAction {
    case logout
    case imageZoom(url: String)
}

protocol HomeDelegate: class {
    func didEndAction(with state: HomeState)
}

protocol HomeVMCoordinatorDelegate: class {
    func moveToNextFlow(controller: HomeController, didSelect action: HomeAction)
}

class HomeViewModel {
    weak var delegate: HomeDelegate?
    weak var coordinator: HomeVMCoordinatorDelegate?
    
    private var breed: DogBreeds = .husky
    private var tableViewList: [HomeCell] = HomeCell.allCases
    private var dogsManager: DogsManager = {
       let manager = DogsManager()
        return manager
    }()
    private var realmManager: RealmManager = {
        let manager = RealmManager()
        return manager
    }()
    
    var dogs: Dogs?
    
    func loadDogs() {
        dogsManager.fetchDogs(by: breed) { [weak self] result in
            switch result {
            case .success(let value):
                self?.dogs = value
                self?.delegate?.didEndAction(with: .success)
            case .failure(let error):
                self?.delegate?.didEndAction(with: .error(error: error))
            }
        }
    }
    
    func logout() {
        guard let user = realmManager.getObj() else { return }
        realmManager.deleteObj(obj: user)
        delegate?.didEndAction(with: .deleted)
    }
}

extension HomeViewModel {
    func numberOfRows() -> Int { return tableViewList.count }
    
    func typeOfCell(for row: Int) -> HomeCell { return tableViewList[row] }
    
    func changeDogBreed(breed: DogBreeds) {
        self.breed = breed
        loadDogs()
    }
    
    func getDog(for url: String) {
        delegate?.didEndAction(with: .dogDetails(url: url))
    }
}
