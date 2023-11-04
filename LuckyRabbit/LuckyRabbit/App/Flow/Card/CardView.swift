//
//  CardView.swift
//  LuckyRabbit
//

import UIKit
import SnapKit

class CardView: UIView {
    
    private let uuid = UUID()

    
    private(set)  var backgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "backBG")
        return imageView
    }()
    
    private(set) lazy var qRImage: UIImageView = {
        let imageView = UIImageView()
        let image = generateQRCode(from: uuid.uuidString)
        imageView.image = image
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 12
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private(set)  var rabbitGroupImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "RabbitGroup")
        imageView.contentMode = .scaleAspectFit
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
        var balance = UserSettings.shared.balanceCount
        let label = UILabel()
        label.textColor = .white
        label.text = "\(balance)"
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
        [backgroundImage,qRImage,rabbitGroupImage,conteinerBalance].forEach(addSubview(_:))
        conteinerBalance.addSubview(balanceLabel)
        conteinerBalance.addSubview(scoreLabel)
    }
    
    private func setUpConstraints(){
        backgroundImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        qRImage.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(34)
            make.centerX.equalToSuperview()
            make.size.equalTo(300)
        }
        
        rabbitGroupImage.snp.makeConstraints { make in
            make.top.equalTo(qRImage.snp.bottom)
            make.bottom.equalTo(conteinerBalance.snp.top).offset(-10)
            make.centerX.equalToSuperview()
            make.height.equalTo(rabbitGroupImage.snp.width).multipliedBy(0.9)
        }
        
        conteinerBalance.snp.makeConstraints { make in
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-40)
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
    
    func generateQRCode(from string: String) -> UIImage? {
        if let qrFilter = CIFilter(name: "CIQRCodeGenerator") {
            qrFilter.setValue(string.data(using: .utf8), forKey: "inputMessage")
            if let qrCodeImage = qrFilter.outputImage {
                let transform = CGAffineTransform(scaleX: 8, y: 8)
                let scaledQRImage = qrCodeImage.transformed(by: transform)
                let context = CIContext()
                if let cgImage = context.createCGImage(scaledQRImage, from: scaledQRImage.extent) {
                    let qrCode = UIImage(cgImage: cgImage)
                    return qrCode
                }
            }
        }
        return nil
    }
    
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
        
        let shadowBorder:CGFloat = (layer.shadowRadius * 2) + 5
        maskLayer.frame = maskLayer.frame.insetBy(dx:  -shadowBorder, dy:  -shadowBorder)
        maskLayer.frame = maskLayer.frame.offsetBy(dx: shadowBorder/2, dy: shadowBorder/2)
        
        maskLayer.fillRule = .evenOdd
                
        let pathMasking = CGMutablePath()
        pathMasking.addPath(UIBezierPath(rect: maskLayer.frame).cgPath)
        var catShiftBorder = CGAffineTransform(translationX: shadowBorder/2, y: shadowBorder/2)
        pathMasking.addPath(maskLayer.path!.copy(using: &catShiftBorder)!)
        maskLayer.path = pathMasking;
        
        layer.mask = maskLayer
        self.layer.addSublayer(layer)
    }
}
