//
//  CardView.swift
//  LuckyRabbit
//

import UIKit
import SnapKit

class CardView: UIView {
    

    private(set)  var backgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "backBGCard")
        return imageView
    }()
    
    private(set)  var qRImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "qRCodeCard")
        return imageView
    }()
    
    private(set)  var conteinerBalance: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "purple")
        view.layer.cornerRadius = 12
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor(named: "lightPink")?.cgColor
        return view
    }()
    
    private(set)  var balanceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "Balance"
        label.font = UIFont(name: "Inter-Regular", size: 20)
        return label
    }()
    
    private(set)  var scoreLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "1000"
        label.font = UIFont(name: "Inter-Black", size: 60)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
        setUpConstraints()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        conteinerBalance.dropShadow(color: UIColor(named: "lightPink"), opacity: 1, offSet:.zero, radius: 29, cornerRadius: 12)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        [backgroundImage,qRImage,conteinerBalance].forEach(addSubview(_:))
        conteinerBalance.addSubview(balanceLabel)
        conteinerBalance.addSubview(scoreLabel)
    }
    
    private func setUpConstraints(){
        backgroundImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        qRImage.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(12)
            make.centerX.equalToSuperview()
            make.size.equalTo(300)
        }
        
        conteinerBalance.snp.makeConstraints { make in
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-60)
            make.left.right.equalToSuperview().inset(24)
            make.height.equalTo(conteinerBalance.snp.width).multipliedBy(0.43)
            
        }
        
        balanceLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(32)
        }
        
        scoreLabel.snp.makeConstraints { make in
            make.top.equalTo(balanceLabel.snp.bottom)
            make.centerX.equalToSuperview()
        }
        
    }
}

extension UIView {
    
    func dropShadow(color: UIColor?, opacity: Float, offSet: CGSize, radius: CGFloat,cornerRadius: CGFloat) {
        let layer = CALayer()
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = false
        layer.shadowColor = color?.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offSet
        layer.shadowRadius = radius
        
        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        
        let maskLayer = CAShapeLayer()
        maskLayer.frame = bounds
        maskLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: layer.cornerRadius).cgPath
        
        //
        // Make the mask area bigger than the view, so the shadow itself does not get clipped by the mask
        //
        let shadowBorder:CGFloat = (layer.shadowRadius * 2) + 5;
        maskLayer.frame = maskLayer.frame.insetBy(dx:  -shadowBorder, dy:  -shadowBorder)  // Make bigger
        maskLayer.frame = maskLayer.frame.offsetBy(dx: shadowBorder/2, dy: shadowBorder/2) // Move top and left
        
        // Allow for cut outs in the shape
        maskLayer.fillRule = .evenOdd
        
        
        //
        // Create new path
        //
        let pathMasking = CGMutablePath()
        // Add the outer view frame
        pathMasking.addPath(UIBezierPath(rect: maskLayer.frame).cgPath)
        // Translate into the shape back to the smaller original view's frame start point
        var catShiftBorder = CGAffineTransform(translationX: shadowBorder/2, y: shadowBorder/2)
        // Now add the original path for the cut out the shape of the original view
        pathMasking.addPath(maskLayer.path!.copy(using: &catShiftBorder)!)
        // Set this big rect with a small cutout rect as the mask
        maskLayer.path = pathMasking;
        
        
        //
        // Set as a mask on the view with the shadow
        //
        layer.mask = maskLayer
        self.layer.addSublayer(layer)
    }
}
