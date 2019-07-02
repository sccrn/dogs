//
//  DogCell.swift
//  Doguitos
//
//  Created by Samanta Clara Coutinho Rondon do Nascimento on 2019-07-01.
//  Copyright © 2019 Sam. All rights reserved.
//

import Foundation
import SDWebImage
import UIKit

class DogCell: UICollectionViewCell {
    @IBOutlet weak var dogImage: UIImageView!

    func configure(url: String) {
        dogImage.sd_setImage(with: URL(string: url), completed: { [weak self] image, error, cacheType, imageURL in
            self?.dogImage.image = image
        })
    }
}
