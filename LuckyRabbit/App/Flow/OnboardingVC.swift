//
//  OnboardingVC.swift
//  LuckyRabbit
//
//  Created by Dmitriy Holovnia on 22.12.2023.
//

import UIKit

class OnboardingVC: UIViewController {

    private lazy var bgImageView: UIImageView = {
        let iv = UIImageView(image: .backBG)
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    private lazy var rabitImageView: UIImageView = {
        let iv = UIImageView(image: .rabbitGroup)
        iv.contentMode = .scaleAspectFit
        return iv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        startAuth()
    }
    
    private func setupViews() {
        view.addSubview(bgImageView)
        bgImageView.addSubview(rabitImageView)
    }
    
    private func setupConstraints() {
        bgImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        rabitImageView.snp.makeConstraints {
            $0.left.equalToSuperview().inset(50)
            $0.right.equalToSuperview().inset(50)
            $0.centerY.equalToSuperview()
            $0.height.equalTo(300)
        }
    }
    
    private func startAuth() {
        Task {
            do {
                try await NetworkManager.shared.authenticate()
                let vc = RootTabBarController()
                vc.modalPresentationStyle = .fullScreen
                present(vc, animated: true)
            } catch {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
}

#Preview {
    OnboardingVC()
}
