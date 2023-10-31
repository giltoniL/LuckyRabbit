//
//  NewsVC.swift
//  LuckyRabbit
//
//  Created by apple on 30.10.2023.
//

import UIKit
import SnapKit

class NewsVC: UIViewController {
    
    
     var contentView: NewsView {
        view as? NewsView ?? NewsView()
    }
    
    override func loadView() {
        view = NewsView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }

}
