//
//  NewsVC.swift
//  LuckyRabbit
//
//  Created by apple on 30.10.2023.
//

import UIKit
import SnapKit

class NewsVC: UIViewController {
    
    
     var contentView: BonusView {
        view as? BonusView ?? BonusView()
    }
    
    override func loadView() {
        view = BonusView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }

}
