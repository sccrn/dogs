//
//  UICollectionView.swift
//  Doguitos
//
//  Created by Samanta Clara Coutinho Rondon do Nascimento on 2019-07-01.
//  Copyright © 2019 Sam. All rights reserved.
//

import Foundation
import UIKit

public extension UICollectionView {
    
    ///Register a cell with his Default name and identifier on the main bundle
    func registerNib<T: UICollectionViewCell>(cellClass: T.Type) {
        self.register(UINib(nibName: T.defaultIdentifier, bundle: Bundle.main), forCellWithReuseIdentifier: T.defaultIdentifier)
    }
    
    ///Dequeue a cell with his default Class Name. Example: MyCustomCell.class
    func dequeue<T: UICollectionViewCell>(cellClass: T.Type, indexPath: IndexPath) -> T {
        return self.dequeue(withIdentifier: cellClass.defaultIdentifier, indexPath: indexPath)
    }
    
    ///Dequeue a cell with automatic casting
    private func dequeue<T: UICollectionViewCell>(withIdentifier id: String, indexPath: IndexPath) -> T {
        return self.dequeueReusableCell(withReuseIdentifier: id, for: indexPath) as! T
    }
}
