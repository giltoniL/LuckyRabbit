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
    
    private(set)  var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "Inter-Black", size: 60)
        label.text = "Your \nbonus"
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private(set)  var iconImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "iconBonus")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    var scoreLabel: UILabel = {
        let label = UILabel()
        label.textColor = .yellow
        label.font = UIFont(name: "Inter-Black", size: 60)
        label.text = ""
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private(set)  var rabbitImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "rabbitBonus")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private (set) var thanksButton: UIButton = {
        let button = UIButton()
        button.setTitle("Thanks", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .yellow
        button.titleLabel?.font = UIFont(name: "Inter-Bold", size: 20)
        button.layer.cornerRadius = 12
        return button
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
        [backgroundImage,titleLabel,iconImage,scoreLabel,rabbitImage,thanksButton].forEach(addSubview(_:))
        
        
    }
    
    private func setUpConstraints(){
        
        backgroundImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(40)
            make.left.right.equalToSuperview().inset(73)
        }
        
        scoreLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }

        iconImage.snp.makeConstraints { make in
            make.right.equalTo(scoreLabel.snp.left).offset(-8)
            make.top.equalTo(titleLabel.snp.bottom).offset(32)
        }
        
        
        rabbitImage.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(24)
            make.top.equalTo(scoreLabel.snp.bottom).offset(53)
            make.bottom.equalTo(thanksButton.snp.top).offset(-53)
        }
        
        thanksButton.snp.makeConstraints { make in
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-30)
            make.left.right.equalToSuperview().inset(24)
            make.height.equalTo(thanksButton.snp.width).multipliedBy(0.16)
        }
    }
}
