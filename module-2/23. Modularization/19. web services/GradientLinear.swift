//
//  GradientLinear.swift
//  19. web services
//
//  Created by Despo on 11.11.24.
//

//
//  Gradient.swift
//  21. Data Persistence 21. Data Persistence 21.Data Persistence
//
//  Created by Despo on 04.11.24.
//
import UIKit

class LinearGradient: UIView {
    let gradientLayer = CAGradientLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        gradientLayer.colors = [UIColor.gradientFirst.cgColor ,UIColor.black.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.locations = .none
        layer.addSublayer(gradientLayer)
    }
    
    override open func layoutSubviews() {
        super.layoutSubviews()
        
        if gradientLayer.frame != bounds {
            gradientLayer.frame = bounds
        }
    }
}
