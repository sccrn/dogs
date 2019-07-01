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

class CategoryCell: UITableViewCell {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var breedDog: UILabel!
    private var dogURLS: [String] = []
    private var collectionDataSource: CategoryCellDataSource?

    func configure(dogs: Dogs?) {
        guard let dog = dogs else { return }
        breedDog.text = dog.category
        dogURLS = dog.list
        
        setupCollection()
    }
    
    private func setupCollection() {
        CategoryCellDataSource.setupDogCollection(collection: collectionView)
        collectionDataSource = CategoryCellDataSource(lists: dogURLS)
        collectionView.dataSource = collectionDataSource
        collectionView.delegate = collectionDataSource
        collectionView.contentInsetAdjustmentBehavior = .always
        collectionView.reloadData()
    }
}
