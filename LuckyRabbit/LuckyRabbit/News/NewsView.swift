//
//  NewsView.swift
//  LuckyRabbit
//


import UIKit
import SnapKit

class NewsView: UIView {
    private(set)  var backgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "backBG")
        return imageView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
        setUpConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(backgroundImage)
        
    }
    
    private func setUpConstraints(){
        backgroundImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
    }
}
