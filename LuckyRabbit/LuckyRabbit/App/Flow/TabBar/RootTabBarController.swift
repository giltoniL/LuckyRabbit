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
        
        
        UITabBar.appearance().unselectedItemTintColor = .white
        UITabBar.appearance().tintColor = .yellow
        UITabBar.appearance().backgroundColor = .purple
        
        
        let bonusVC = BonusVC()
        buildConfig(bonusVC, title: "Bonus")
        
        
        let coctailsVC = CoctailsVC()
        let coctailsNavController = UINavigationController(rootViewController: coctailsVC)
        buildConfig(coctailsNavController, title: "Coctails")
        
        let cardVC = CardVC()
        buildConfig(cardVC, title: "Card")
        
        let newsVC = NewsVC()
        let newsNavController = UINavigationController(rootViewController: newsVC)
        buildConfig(newsNavController, title: "News")
        
        let infoVC = InfoVC()
        buildConfig(infoVC, title: "Info")
        
        viewControllers = [bonusVC, coctailsNavController, cardVC, newsNavController, infoVC]
        
    }
    
    private func buildConfig(_ vc: UIViewController, title: String) {
        vc.tabBarItem.title = title
    }
}


//func goDailyScreen() {
//    let vc = DailyBonusVC()
//    if let lastVisitDate = UserSettings.shared.lastBonusDate {
//        let calendar = Calendar.current
//        if let hours = calendar.dateComponents([.hour], from: lastVisitDate, to: Date()).hour, hours < 24 {
//            let vcDate = WaitDateVC()
////            navigationController?.pushViewController(vcDate, animated: true)
//        } else {
////            navigationController?.pushViewController(vc, animated: true)
//        }
//    } else {
////        navigationController?.pushViewController(vc, animated: true)
//    }
//}
