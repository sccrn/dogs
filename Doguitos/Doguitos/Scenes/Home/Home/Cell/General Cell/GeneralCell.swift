//
//  GeneralCell.swift
//  Doguitos
//
//  Created by Samanta Clara Coutinho Rondon do Nascimento on 2019-07-01.
//  Copyright © 2019 Sam. All rights reserved.
//

import UIKit

protocol GeneralCellDelegate: class {
    func didSelect(breed: DogBreeds)
}

class GeneralCell: UITableViewCell {
    weak var delegate: GeneralCellDelegate?
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var collectionDataSource: GeneralCellDataSource?
    private let flowLayout = DFlowLayout()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCollection()
    }

    private func setupCollection() {
        GeneralCellDataSource.setupBreedsCollection(collection: collectionView)
        collectionDataSource = GeneralCellDataSource(delegate: self)
        collectionView.dataSource = collectionDataSource
        collectionView.delegate = collectionDataSource
        collectionView.collectionViewLayout = flowLayout
        collectionView.contentInsetAdjustmentBehavior = .always
    }
}

extension GeneralCell: GeneralCellDataSourceDelegate {
    func didSelect(breed: DogBreeds) {
        delegate?.didSelect(breed: breed)
    }
}
