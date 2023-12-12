//
//  infoView.swift
//  LuckyRabbit


import Foundation
import UIKit

class InfoView: UIView {
    
    private (set) var backgroundimageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "backBG")
        return imageView
    }()
    
    private(set) lazy var imageConteinerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.65).cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = .init(width: 0, height: 8)
        view.layer.shadowRadius = 14
        return view
    }()

    private (set) var iconImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "AppIcon")
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 12
        return imageView
    }()
    
    private(set) var subTitleLabel: UILabel = {
        let label = UILabel() // Создайте экземпляр GradientLabel
        label.text = "\(Settings.appTitle)"
        label.textColor = .white
        label.font = UIFont(name: "Inter-Black", size: 48)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()

    lazy var contentLabel: UILabel = {
        let label = UILabel()
        label.text = "Felix the rabbit lived in the forest, and he couldn’t be happier. His eyes sparkled with wonder, and his joy seemed to envelop the entire forest. Felix created a magical cocktail called the Happy Potion, which brought joy to everyone. All the inhabitants of the forest passed through his smile, and since then, fun has become a part of their daily life.\n\(Settings.appTitle) is an app where the magic of rabbits and delicious cocktails meet!\nScan the code and immediately receive a 5% discount on your order. This is our special offer for you to make every visit to \(Settings.appTitle) even more magical.Let your taste buds take you on an exciting adventure with our unique cocktail combinations\nFind out more about the mysterious rabbits in the News section. Immerse yourself in the exciting adventures of the Twin Rabbits, the Lucky Bunny and the Kung Fu Bunny. We share interesting facts and amazing stories to make your time at Lucky Rabbit not only delicious, but also exciting."
        label.textColor = .white
        label.font = UIFont(name: "Inter-Regular", size: 12)
        label.numberOfLines = 0
        return label
    }()
    
    let infoConteinerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    let infoScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.backgroundColor = .clear
        scrollView.isScrollEnabled = true
        scrollView.isDirectionalLockEnabled = true
        scrollView.contentInset = UIEdgeInsets(top: 56, left: 0, bottom: -56, right: 0)
        return scrollView
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
        addSubview(infoScrollView)
        infoScrollView.addSubview(infoConteinerView)
        infoConteinerView.addSubview(imageConteinerView)
        infoConteinerView.addSubview(subTitleLabel)
        infoConteinerView.addSubview(contentLabel)
        imageConteinerView.addSubview(iconImage)
    }
    
    private func setupConstraints() {
        backgroundimageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        infoScrollView.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(24)
            make.bottom.top.equalToSuperview()
        }
        
        infoConteinerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        imageConteinerView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.size.equalTo(200)
        }
        
        iconImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        
        subTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(iconImage.snp.bottom).offset(40)
            make.centerX.equalToSuperview()
        }
        
        contentLabel.snp.makeConstraints { make in
            make.top.equalTo(subTitleLabel.snp.bottom).offset(20)
            make.left.right.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().inset(56)
        }
    }
}
