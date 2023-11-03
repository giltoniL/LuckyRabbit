//
//  BonusScreenVC.swift
//  LuckyRabbit


import UIKit
import SnapKit

class BonusScreenVC: UIViewController {
    
    
     var contentView: BonusScreenView {
        view as? BonusScreenView ?? BonusScreenView()
    }
    
    override func loadView() {
        view = BonusScreenView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentView.thanksButton.addTarget(self, action: #selector(closeView), for: .touchUpInside)

    }
    @objc func closeView() {
        UserSettings.shared.lastBonusDate = Date()
        dismiss(animated: true)
        
    }

}
