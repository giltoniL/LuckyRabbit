//
//  TimeNextBonusView.swift
//  LuckyRabbit


import UIKit
import SnapKit

class TimeNextBonusView: UIView {
    
    private(set)  var backgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "backTimeBonusBg")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    private(set)  var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "Inter-Regular", size: 20)
        label.text = "Time to next spin"
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()

    private(set) lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont(name: "Inter-Black", size: 60)
        label.translatesAutoresizingMaskIntoConstraints = false
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
        backgroundImage.addSubview(titleLabel)
        backgroundImage.addSubview(timeLabel)
        
    }
    
    private func setUpConstraints(){
        
        backgroundImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(60)
        }
        
        timeLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
        }
    }
}

