//
//  GradientView.swift
//  LuckyRabbit
//


import UIKit
import SnapKit

class GradientView: UIView {
    
    let gradientLayer = CAGradientLayer()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
        setupUI()
//        setUpConstraints()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        gradientLayer.bounds = self.bounds.insetBy(dx: -0.5 * self.bounds.size.width, dy: -0.5 * self.bounds.size.height)
        gradientLayer.position = self.center

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        gradientLayer.colors = [
          UIColor(red: 0.851, green: 0.851, blue: 0.851, alpha: 0).cgColor,
          UIColor(red: 0.851, green: 0.851, blue: 0.851, alpha: 1).cgColor,
          UIColor(red: 0.851, green: 0.851, blue: 0.851, alpha: 0).cgColor


        ]
        gradientLayer.locations = [0, 0.51, 1]
        gradientLayer.startPoint = CGPoint(x: 0.25, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 0.75, y: 0.5)
        gradientLayer.transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: 0, b: 1, c: -1, d: 0, tx: 1, ty: 0))

        layer.masksToBounds = true


    }
    
     func setupLayer(view: UIView){
        view.layer.mask = gradientLayer
    }
}
