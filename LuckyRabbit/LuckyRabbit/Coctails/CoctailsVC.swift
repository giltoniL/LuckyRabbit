//
//  CoctailsVC.swift
//  LuckyRabbit
//
//  Created by apple on 30.10.2023.
//

import UIKit
import SnapKit

class CoctailsVC: UIViewController {
    
    
     var contentView: CoctailView {
        view as? CoctailView ?? CoctailView()
    }
    
    override func loadView() {
        view = CoctailView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }

}
