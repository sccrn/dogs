//
//  CategoryCellDataSource.swift
//  Doguitos
//
//  Created by Samanta Clara Coutinho Rondon do Nascimento on 2019-07-01.
//  Copyright © 2019 Sam. All rights reserved.
//

import Foundation
import UIKit

protocol CategoryCellDataSourceDelegate: class {
    func didSelect(url: String)
}

class CategoryCellDataSource: NSObject {
    weak var delegate: CategoryCellDataSourceDelegate?
    private var dog: Dogs
    
    init(dog: Dogs, delegate: CategoryCellDataSourceDelegate) {
        self.dog = dog
        self.delegate = delegate
    }
}

extension CategoryCellDataSource: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dog.list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeue(cellClass: DogCell.self, indexPath: indexPath)
        cell.configure(url: dog.list[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelect(url: dog.list[indexPath.row])
    }
}

extension CategoryCellDataSource {
    class func setupDogCollection(collection: UICollectionView?) {
        collection?.registerNib(cellClass: DogCell.self)
    }
}
