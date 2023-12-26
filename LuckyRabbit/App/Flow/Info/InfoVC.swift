//
//  InfoVC.swift
//  LuckyRabbit
//
//  Created by apple on 30.10.2023.
//

import UIKit
import SnapKit

class InfoVC: UIViewController {
    
    
    var contentView: InfoView {
        view as? InfoView ?? InfoView()
    }
    
    override func loadView() {
        view = InfoView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tappedButtons()
    }
    
    
    private func tappedButtons() {
        contentView.profileBtn.addTarget(self, action: #selector(buttonProfile), for: .touchUpInside)
    }
    
    @objc func buttonProfile() {
        let profileVC = ProfileVC()
        profileVC.modalPresentationStyle = .formSheet
        present(profileVC, animated: true, completion: nil)
    }

}
