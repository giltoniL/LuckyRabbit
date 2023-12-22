//
//  CoctailDetailsQRView.swift
//  LuckyRabbit

import Foundation
import UIKit

class CoctailDetailsQRView: UIView {

    let backgroundimageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "backBG")
        return imageView
    }()
    
    let backButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "backBtn"), for: .normal)
        button.isHidden = true
        return button
    }()
    
    private (set) var coctailQrConteiner: UIView = {
        let view = UIView()
        return view
    }()
    
    private (set) var coctailConteiner: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "purple")
        view.layer.cornerRadius = 12
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor(named: "lightPink")?.cgColor
        return view
    }()
    
    private (set) var coctailLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "Coctail"
        label.font = UIFont(name: "Inter-Black", size: 40)
        label.numberOfLines = 0
        return label
    }()
    
    let qrCodeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 30
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private (set) var hideButton: UIButton = {
        let button = UIButton()
        button.setTitle("HIDE", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .yellow
        button.titleLabel?.font = UIFont(name: "Inter-Bold", size: 20)
        button.layer.cornerRadius = 12
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
        setupConstraints()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        coctailConteiner.dropShadow(color: UIColor(named: "lightPink"), opacity: 1, offSet:.zero, radius: 29, cornerRadius: 12)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        [backgroundimageView,coctailQrConteiner,coctailLabel,backButton] .forEach(addSubview(_:))
        
        coctailQrConteiner.addSubview(coctailConteiner)
        
        coctailConteiner.addSubview(qrCodeImageView)
        coctailConteiner.addSubview(hideButton)
    }
    
    private func setupConstraints() {
    
        backgroundimageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        backButton.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(24)
            make.top.equalToSuperview().inset(56)
        }
        
        coctailLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(56)
        }
        
        coctailQrConteiner.snp.makeConstraints { make in
            make.top.equalTo(backButton.snp.bottom).offset(20)
            make.left.right.equalToSuperview().inset(24)
            make.bottom.equalToSuperview().offset(-46)
        }
        
        coctailConteiner.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        qrCodeImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(80)
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(qrCodeImageView.snp.width)
        }
        
        hideButton.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview().inset(20)
            make.height.equalTo(46)
        }
    }
}
