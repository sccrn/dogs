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
    
    func configure(dogURL: String) {
        dogImage.sd_setImage(with: URL(string: dogURL))
    }
}
