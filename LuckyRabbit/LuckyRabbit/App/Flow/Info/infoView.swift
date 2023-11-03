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
    
    private (set) var iconImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "AppIcon")
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
        label.text = "Lorem ipsum dolor sit amet consectetur. Justo cras accumsan tellus porttitor venenatis venenatis quam. Placerat non at vestibulum vulputate. Scelerisque etiam id feugiat nibh facilisis nibh egestas. Nunc tempor adipiscing eleifend facilisis lectus leo venenatis. Sed euismod sed sodales vel in quam parturient. Consequat sed pretium senectus orci praesent tincidunt hac maecenas sed. Ultrices sed amet penatibus magna sit ut egestas et aenean. Eget accumsan a sapien sit sagittis ultrices in accumsan. Viverra amet volutpat egestas metus.Sit venenatis egestas cras lectus. Gravida ornare sed aliquam pellentesque. Justo neque orci neque mollis est sit varius. Ipsum nulla fringilla habitant phasellus lobortis aliquet faucibus nullam. Purus nulla a dui non lacus eget adipiscing. Sit dolor et varius adipiscing non praesent. Enim tortor vestibulum odio molestie tortor vulputate turpis. Habitant varius vulputate integer integer fermentum lectus arcu odio. Nibh eget pretium vitae sed scelerisque mauris ipsum pharetra sagittis. Placerat erat faucibus nisl nunc ut sed volutpat gravida nibh.leo venenatis. Sed euismod sed sodales vel in quam parturient. Consequat sed pretium senectus orci praesent tincidunt hac maecenas sed. Ultrices sed amet penatibus magna sit ut egestas et aenean. Eget accumsan a sapien sit sagittis ultrices in accumsan. Viverra amet volutpat egestas metus.Sit venenatis egestas cras lectus. Gravida ornare sed aliquam pellentesque. Justo neque orci neque mollis est sit varius. Ipsum nulla fringilla habitant phasellus lobortis aliquet faucibus nullam. Purus nulla a dui non lacus eget adipiscing. Sit dolor et varius adipiscing non praesent. Enim tortor vestibulum odio molestie tortor vulputate turpis. Habitant varius vulputate integer integer fermentum lectus arcu odio. Nibh eget pretium vitae sed scelerisque mauris ipsum pharetra sagittis. Placerat erat faucibus nisl nunc ut sed volutpat gravida nibh.leo venenatis. Sed euismod sed sodales vel in quam parturient. Consequat sed pretium senectus orci praesent tincidunt hac maecenas sed. Ultrices sed amet penatibus magna sit ut egestas et aenean. Eget accumsan a sapien sit sagittis ultrices in accumsan. Viverra amet volutpat egestas metus.Sit venenatis egestas cras lectus. Gravida ornare sed aliquam pellentesque. Justo neque orci neque mollis est sit varius. Ipsum nulla fringilla habitant phasellus lobortis aliquet faucibus nullam. Purus nulla a dui non lacus eget adipiscing. Sit dolor et varius adipiscing non praesent. Enim tortor vestibulum odio molestie tortor vulputate turpis. Habitant varius vulputate integer integer fermentum lectus arcu odio. Nibh eget pretium vitae sed scelerisque mauris ipsum pharetra sagittis. Placerat erat faucibus nisl nunc ut sed volutpat gravida nibh."
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
        infoConteinerView.addSubview(iconImage)
        infoConteinerView.addSubview(subTitleLabel)
        infoConteinerView.addSubview(contentLabel)
        
        
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
        
        iconImage.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.size.equalTo(200)
        }
        
        subTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(iconImage.snp.bottom).offset(40)
            make.centerX.equalToSuperview()
        }
        
        contentLabel.snp.makeConstraints { make in
            make.top.equalTo(subTitleLabel.snp.bottom).offset(40)
            make.left.right.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().inset(56)
        }
    }
}
