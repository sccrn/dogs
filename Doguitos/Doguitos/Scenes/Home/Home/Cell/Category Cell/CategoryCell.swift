//
//  CategoryCell.swift
//  Doguitos
//
//  Created by Samanta Clara Coutinho Rondon do Nascimento on 2019-07-01.
//  Copyright © 2019 Sam. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage

protocol CategoryCellDelegate: class {
    func didSelect(url: String)
}

class CategoryCell: UITableViewCell {
    weak var delegate: CategoryCellDelegate?
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var breedDog: UILabel!
    private var dog: Dogs?
    private var collectionDataSource: CategoryCellDataSource?

    func configure(dogs: Dogs?) {
        dog = dogs
        breedDog.text = dogs?.category.capitalizingFirstLetter()
        setupCollection()
    }
    
    private func setupCollection() {
        guard let dogs = dog else { return }
        CategoryCellDataSource.setupDogCollection(collection: collectionView)
        collectionDataSource = CategoryCellDataSource(dog: dogs, delegate: self)
        collectionView.dataSource = collectionDataSource
        collectionView.delegate = collectionDataSource
        collectionView.contentInsetAdjustmentBehavior = .always
        collectionView.reloadData()
    }
}

extension CategoryCell: CategoryCellDataSourceDelegate {
    func didSelect(url: String) {
        delegate?.didSelect(url: url)
    }
}
