//
//  DGradient.swift
//  Doguitos
//
//  Created by Samanta Clara Coutinho Rondon do Nascimento on 2019-07-02.
//  Copyright © 2019 Sam. All rights reserved.
//

import UIKit

///This class will do the view's gradient in Splash's screen,
///we're using IBDesignable to set up in the XIB.
///For this class, we're putting clear colors to be generic.
@IBDesignable
class DGradient: UIView {
    
    @IBInspectable var firstColor: UIColor = UIColor.clear {
        didSet { setupGradient() }
    }
    
    @IBInspectable var secondColor: UIColor = UIColor.clear {
        didSet { setupGradient() }
    }
    
    @IBInspectable var thirdColor: UIColor = UIColor.clear {
        didSet { setupGradient() }
    }
    
    override class var layerClass: AnyClass {
        get { return CAGradientLayer.self }
    }
    
    ///Creation of our layer and it's gonna present.
    func setupGradient() {
        let layer = self.layer as! CAGradientLayer
        layer.colors = [firstColor, secondColor, thirdColor].map { $0.cgColor }
        layer.startPoint = CGPoint(x: 0, y: 0.15)
        layer.endPoint = CGPoint (x: 0.05, y: 1)
    }
}

