//
//  GeneralCellDataSource.swift
//  Doguitos
//
//  Created by Samanta Clara Coutinho Rondon do Nascimento on 2019-07-01.
//  Copyright © 2019 Sam. All rights reserved.
//

import Foundation
import UIKit

enum DogBreeds: String, CaseIterable {
    case husky
    case hound
    case pug
    case labrador
    
    var image: UIImage {
        switch self {
        case .husky: return #imageLiteral(resourceName: "husky")
        case .hound: return #imageLiteral(resourceName: "hound")
        case .pug: return #imageLiteral(resourceName: "pug")
        case .labrador: return #imageLiteral(resourceName: "labrador")
        }
    }
}

protocol GeneralCellDataSourceDelegate: class {
    func didSelect(breed: DogBreeds)
}

class GeneralCellDataSource: NSObject {
    weak var delegate: GeneralCellDataSourceDelegate?
    private var dogs: [DogBreeds] = DogBreeds.allCases
    
    init(delegate: GeneralCellDataSourceDelegate) {
        self.delegate = delegate
    }
}

extension GeneralCellDataSource: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dogs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeue(cellClass: BreedCell.self, indexPath: indexPath)
        cell.configure(breedImage: dogs[indexPath.row].image)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        delegate?.didSelect(breed: dogs[indexPath.row])
    }
}

extension GeneralCellDataSource {
    class func setupBreedsCollection(collection: UICollectionView?) {
        collection?.registerNib(cellClass: BreedCell.self)
    }
}
