//
//  CoctailView.swift
//  LuckyRabbit

import Foundation
import UIKit

class CoctailView: UIView {
    
    private lazy var backgroundimageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "backBG")
        return imageView
    }()
    
    private(set) lazy var coctailTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.backgroundColor = .clear
        tableView.showsVerticalScrollIndicator = false
        tableView.contentInset = UIEdgeInsets(top: 30, left: 0, bottom: -30, right: 0)
        tableView.register(CoctailCell.self, forCellReuseIdentifier: CoctailCell.reuseId)
        return tableView
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
        [backgroundimageView,coctailTableView].forEach(addSubview(_:))
        
    }
    
    
    private func setupConstraints() {
        backgroundimageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        
        coctailTableView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
            make.left.right.equalToSuperview().inset(24)
        }
    }
}

