//
//  CardVC.swift
//  LuckyRabbit
//
//  Created by apple on 30.10.2023.
//

import UIKit
import SnapKit

class CardVC: UIViewController {
    
    
     var contentView: CardView {
        view as? CardView ?? CardView()
    }
    
    override func loadView() {
        view = CardView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        contentView.scoreLabel.text = "\(UserSettings.shared.balanceCount)"
    }
}
