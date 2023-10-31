//
//  RootTabBarController.swift
//  LuckyRabbit
//
//  Created by apple on 30.10.2023.
//

import UIKit

class RootTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bonusVC = BonusVC()
        buildConfig(bonusVC, title: "Bonus")
        
        let coctailsVC = CoctailsVC()
        buildConfig(coctailsVC, title: "Coctails")
        
        let cardVC = CardVC()
        buildConfig(cardVC, title: "Card")
        
        let newsVC = NewsVC()
        buildConfig(newsVC, title: "News")
        
        let infoVC = InfoVC()
        buildConfig(infoVC, title: "Info")
        
        viewControllers = [bonusVC, coctailsVC, cardVC, newsVC, infoVC]
        
    }
    
    private func buildConfig(_ vc: UIViewController, title: String) {
        vc.tabBarItem.title = title
    }
}
