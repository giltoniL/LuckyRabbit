//
//  NewsDetailsView.swift
//  LuckyRabbit


import Foundation
import UIKit


class NewsDetailView: UIView {
    
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
    
    private (set) var newsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "News"
        label.font = UIFont(name: "Inter-Black", size: 40)
        label.numberOfLines = 0
        return label
    }()

    let newsConteinerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    let newsScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.backgroundColor = .clear
        scrollView.isScrollEnabled = true
        scrollView.isDirectionalLockEnabled = true
        scrollView.contentInset = UIEdgeInsets(top: 56, left: 0, bottom: 0, right: 0)
        return scrollView
    }()
    
    let newsDetailConteiner: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "purple")
        view.layer.cornerRadius = 12
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor(named: "lightPink")?.cgColor
        view.clipsToBounds = true
        return view
    }()
    
    let titleNewsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .yellow
        label.font = UIFont(name: "Inter-Bold", size: 32)
        label.numberOfLines = 0
        return label
    }()
    
    var newsDetailImage: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        return imageView
    }()
    

    
    lazy var contentLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "Inter-Regular", size: 12)
        label.numberOfLines = 0
        return label
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
        setupConstraints()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        newsDetailConteiner.dropShadow(color: UIColor(named: "lightPink"), opacity: 1, offSet:.zero, radius: 29, cornerRadius: 12)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupUI() {
        [backgroundimageView,newsScrollView,backButton] .forEach(addSubview(_:))
        
        newsScrollView.addSubview(newsDetailConteiner)
        newsScrollView.addSubview(newsLabel)
        
        newsDetailConteiner.addSubview(titleNewsLabel)
        newsDetailConteiner.addSubview(newsDetailImage)
        newsDetailConteiner.addSubview(contentLabel)
    }
    
    
    private func setupConstraints() {
        
        backgroundimageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        backButton.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(24)
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(12)
        }
        
        
        newsScrollView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.left.right.equalToSuperview().inset(24)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
        }
        
        newsLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview()
        }
        
        newsDetailConteiner.snp.makeConstraints { make in
            make.top.equalTo(newsLabel.snp.bottom).offset(10)
            make.left.right.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
       

        newsDetailImage.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.right.equalToSuperview()
            make.width.equalTo(345)
            make.height.equalTo(208)
        }
        
        titleNewsLabel.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(20)
            make.top.equalTo(newsDetailImage.snp.bottom).offset(20)
        }
        
        contentLabel.snp.makeConstraints { make in
            make.top.equalTo(titleNewsLabel.snp.bottom).offset(12)
            make.left.right.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().offset(-20)
        }
    }
}


