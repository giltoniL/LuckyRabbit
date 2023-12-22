//
//  BonusScreenVC.swift
//  LuckyRabbit


import UIKit
import SnapKit

class BonusScreenVC: UIViewController {
    
    var total: Int = 0
    
    
    var contentView: BonusScreenView {
        view as? BonusScreenView ?? BonusScreenView()
    }
    
    override func loadView() {
        view = BonusScreenView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.scoreLabel.text = "\(total)"
        contentView.thanksButton.addTarget(self, action: #selector(closeView), for: .touchUpInside)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        UserSettings.shared.balanceCount += total
        print("\(UserSettings.shared.balanceCount)")
    }
    
    @objc func closeView() {
        UserSettings.shared.lastBonusDate = Date()
        dismiss(animated: true)
        
    }
    
}
