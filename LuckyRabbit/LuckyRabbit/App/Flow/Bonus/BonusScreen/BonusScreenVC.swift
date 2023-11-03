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
        

    }

}
