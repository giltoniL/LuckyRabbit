//
//  ProfiveVIew.swift
//  LuckyRabbit

//
//  ProfileView.swift

import Foundation
import UIKit

class ProfileView: UIView,UITextFieldDelegate {
    
    private lazy var backView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage.backBG
        return imageView
    }()
    
    private(set) lazy var homeBtn: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage.backButton, for: .normal)
        return button
    }()
    
    private(set) lazy var profileBtn: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage.cameraProfile, for: .normal)
        return button
    }()
    
    private lazy var profileTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "User Name".uppercased()
        textField.layer.borderWidth = 3
        textField.layer.borderColor = UIColor.white.withAlphaComponent(0.5).cgColor
        textField.layer.cornerRadius = 30
        textField.textAlignment = .center
        textField.delegate = self
        textField.returnKeyType = .done
        textField.resignFirstResponder()
        return textField
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setUpConstraints()
        saveName()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(backView)
        addSubview(homeBtn)
        addSubview(profileBtn)
        addSubview(profileTextField)
    }
    
    private func setUpConstraints(){
        
        backView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        homeBtn.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(34)
            make.left.equalToSuperview().offset(24)
            make.size.equalTo(48)
        }
        
        profileBtn.snp.makeConstraints { (make) in
            make.top.equalTo(homeBtn.snp.bottom).offset(40)
            make.centerX.equalToSuperview()
            make.size.equalTo(160)
        }
        
        profileTextField.snp.makeConstraints { (make) in
            make.top.equalTo(profileBtn.snp.bottom).offset(40)
            make.left.right.equalToSuperview().inset(24)
            make.height.equalTo(66)
        }
    }
    
    private func saveName() {
        guard let user = UserSettings.shared.userName else { return }
        if let savedUserName = UserSettings.shared.userName {
            profileTextField.text = "\(user)"
        }
    }
    
    internal func textFieldDidEndEditing(_ textField: UITextField) {
        UserSettings.shared.userName = textField.text
    }

    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder() // Закрытие клавиатуры
        return true
    }
}
