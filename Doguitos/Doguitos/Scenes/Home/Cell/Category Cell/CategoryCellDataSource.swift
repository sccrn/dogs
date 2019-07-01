//
//  CategoryCellDataSource.swift
//  Doguitos
//
//  Created by Samanta Clara Coutinho Rondon do Nascimento on 2019-07-01.
//  Copyright © 2019 Sam. All rights reserved.
//

import Foundation
import UIKit

class CategoryCellDataSource: NSObject {
    private var lists: [String] = []
    
    init(lists: [String]) {
        self.lists = lists
    }
}

extension CategoryCellDataSource: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return lists.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeue(cellClass: DogCell.self, indexPath: indexPath)
        cell.configure(dogURL: lists[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

extension CategoryCellDataSource {
    class func setupDogCollection(collection: UICollectionView?) {
        collection?.registerNib(cellClass: DogCell.self)
    }
}
