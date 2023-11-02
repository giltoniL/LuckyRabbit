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
        return button
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
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(backgroundimageView)
        addSubview(backButton)
        addSubview(coctailLabel)
        addSubview(qrCodeImageView)
        addSubview(hideButton)
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
        
        qrCodeImageView.snp.makeConstraints { make in
            make.top.equalTo(coctailLabel.snp.bottom).offset(80)
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(qrCodeImageView.snp.width)
        }
        
        hideButton.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview().inset(20)
            make.height.equalTo(46)
        }
        
        
    }
}
