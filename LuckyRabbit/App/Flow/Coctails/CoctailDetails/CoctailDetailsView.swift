//
//  CoctailDetailsView.swift
//  LuckyRabbit


import Foundation
import UIKit

class CoctailDetailsView: UIView {
    
    
    private lazy var backgroundimageView: UIImageView = {
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
        label.text = "Cocktail"
        label.font = UIFont(name: "Inter-Black", size: 40)
        label.numberOfLines = 0
        return label
    }()
    
    private (set) var coctailDetailConteiner: UIView = {
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
    
    
    
    private (set) var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .yellow
        label.font = UIFont(name: "Inter-Bold", size: 32)
        label.numberOfLines = 0
        return label
    }()
    
    private (set) var coctailBigImage: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 12
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private (set) var volumeLabel: UILabel = {
        let label = UILabel()
        label.text = "Volume:"
        label.textColor = .white
        label.font = UIFont(name: "Inter-Bold", size: 20)
        label.numberOfLines = 0
        return label
    }()
    
    private (set) var creditsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "Credits:"
        label.font = UIFont(name: "Inter-Bold", size: 20)
        label.numberOfLines = 0
        return label
    }()
    
    private (set) var ingredientsLabel: UILabel = {
        let label = UILabel()
        label.text = "Ingredients:"
        label.textColor = .white
        label.font = UIFont(name: "Inter-Bold", size: 20)
        label.numberOfLines = 0
        return label
    }()
    
    private (set) var volumeScoreLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "Inter-Regular", size: 20)
        label.numberOfLines = 0
        return label
    }()
    
    private (set) var creditsScoreLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "Inter-Regular", size: 20)
        label.numberOfLines = 0
        return label
    }()
    
    private (set) var ingredientsScoreLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "Inter-Regular", size: 20)
        label.numberOfLines = 0
        return label
    }()
    
    private (set) var payButton: UIButton = {
        let button = UIButton()
        button.setTitle("PAY", for: .normal)
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
        adjustFontSizesForScreenSize()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        coctailConteiner.dropShadow(color: UIColor(named: "lightPink"), opacity: 1, offSet:.zero, radius: 29, cornerRadius: 12)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        [backgroundimageView,coctailDetailConteiner,coctailLabel,backButton] .forEach(addSubview(_:))
        
        coctailDetailConteiner.addSubview(coctailConteiner)
        
        coctailConteiner.addSubview(coctailBigImage)
        coctailConteiner.addSubview(titleLabel)
        coctailConteiner.addSubview(payButton)
        coctailConteiner.addSubview(creditsLabel)
        coctailConteiner.addSubview(creditsScoreLabel)
        coctailConteiner.addSubview(volumeLabel)
        coctailConteiner.addSubview(volumeScoreLabel)
        coctailConteiner.addSubview(ingredientsLabel)
        coctailConteiner.addSubview(ingredientsScoreLabel)
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
        
        coctailDetailConteiner.snp.makeConstraints { make in
            make.top.equalTo(backButton.snp.bottom).offset(20)
            make.left.right.equalToSuperview().inset(24)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).inset(12)
        }
        
        coctailConteiner.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        coctailBigImage.snp.makeConstraints { make in
            make.left.right.top.equalToSuperview()
            make.bottom.equalTo(titleLabel.snp.top).offset(-20)
            make.height.equalTo(coctailBigImage.snp.width).multipliedBy(0.7)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(coctailBigImage.snp.bottom).offset(20)
            make.left.right.equalToSuperview().inset(20)
        }
        
        volumeLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
        }
        
        creditsLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.top.equalTo(volumeLabel.snp.bottom).offset(20)
        }
        
        ingredientsLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.top.equalTo(creditsLabel.snp.bottom).offset(20)
        }
        
        volumeScoreLabel.snp.makeConstraints { make in
            make.left.equalTo(volumeLabel.snp.right).offset(12)
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
        }
        
        creditsScoreLabel.snp.makeConstraints { make in
            make.left.equalTo(creditsLabel.snp.right).offset(12)
            make.top.equalTo(volumeScoreLabel.snp.bottom).offset(20)
        }
        
        ingredientsScoreLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(40)
            make.top.equalTo(ingredientsLabel.snp.bottom).offset(12)
        }
        
        payButton.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(20)
            make.bottom.equalToSuperview()
            make.height.equalTo(payButton.snp.width).multipliedBy(0.16)
            make.bottom.equalToSuperview().offset(-12)
        }
    }
    
    private func adjustFontSizesForScreenSize() {
        let screenSize = UIScreen.main.bounds
        let smallerScreenHeight: CGFloat = 812

        if screenSize.height < smallerScreenHeight {
            titleLabel.font = UIFont(name: "Inter-Black", size: 30)
            volumeLabel.font = UIFont(name: "Inter-Black", size: 14)
            creditsLabel.font = UIFont(name: "Inter-Black", size: 14)
            ingredientsLabel.font = UIFont(name: "Inter-Black", size: 14)
            volumeScoreLabel.font = UIFont(name: "Inter-Black", size: 14)
            creditsScoreLabel.font = UIFont(name: "Inter-Black", size: 14)
            ingredientsScoreLabel.font = UIFont(name: "Inter-Black", size: 14)
            
        }
    }
}
