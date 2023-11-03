//
//  BonusScreenView.swift
//  LuckyRabbit


import UIKit
import SnapKit

class BonusScreenView: UIView {
    
    private(set)  var backgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "backBG")
        return imageView
    }()
    
    private(set)  var sectordImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "frameSector")
        return imageView
    }()
    
    private (set) var spinButton: UIButton = {
        let button = UIButton()
        button.setTitle("SPIN BUTTON", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .yellow
        button.titleLabel?.font = UIFont(name: "Inter-Bold", size: 20)
        button.layer.cornerRadius = 12
        return button
    }()
    
    private(set)  var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "Inter-Black", size: 60)
        label.text = "Get dayli \nbonus"
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .brown
        setupUI()
        setUpConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(backgroundImage)
        addSubview(sectordImage)
        addSubview(spinButton)
        addSubview(titleLabel)
        
    }
    
    private func setUpConstraints(){
        
        backgroundImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(12)
            make.left.right.equalToSuperview().inset(54)
        }
        
        sectordImage.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        spinButton.snp.makeConstraints { make in
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-60)
            make.left.right.equalToSuperview().inset(24)
            make.height.equalTo(spinButton.snp.width).multipliedBy(0.16)
        }
    }
}
