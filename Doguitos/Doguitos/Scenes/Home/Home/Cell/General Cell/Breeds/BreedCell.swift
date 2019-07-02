//
//  BreedCell.swift
//  Doguitos
//
//  Created by Samanta Clara Coutinho Rondon do Nascimento on 2019-07-01.
//  Copyright © 2019 Sam. All rights reserved.
//

import Foundation
import UIKit

class BreedCell: UICollectionViewCell {
    @IBOutlet weak var breedImage: UIImageView!
    
    func configure(breedImage: UIImage) {
        self.breedImage.image = breedImage
    }
}
