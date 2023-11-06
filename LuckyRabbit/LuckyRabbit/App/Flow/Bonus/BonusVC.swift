//
//  BonusVC.swift
//  LuckyRabbit


import UIKit
import SnapKit

class BonusVC: UIViewController {
    
    var isTime: Bool = true
    
    var contentView: BonusView {
        view as? BonusView ?? BonusView()
    }
    
    override func loadView() {
        view = BonusView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentView.spinButton.addTarget(self, action: #selector(openBonus), for: .touchUpInside)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        goDailyScreen()
        
    }
    
    @objc func openBonus() {
        contentView.sector.spinLabels { [weak self] in
            self?.presentBonusScreenVC()
        }
    }
    
    func presentBonusScreenVC() {
        let bonusScreenVC = BonusScreenVC()
        bonusScreenVC.total = contentView.sector.total
        bonusScreenVC.modalPresentationStyle = .fullScreen
        present(bonusScreenVC, animated: true, completion: nil)
    }
    
    
}

extension BonusVC {
    func goDailyScreen() {
        if let lastVisitDate = UserSettings.shared.lastBonusDate {
            let calendar = Calendar.current
            if let hours = calendar.dateComponents([.hour], from: lastVisitDate, to: Date()).hour, hours < 24 {
                isTime = true
                contentView.timerView.isHidden = false
                startCountdownTimer()
            } else {
                isTime = false
                contentView.timerView.isHidden = true
            }
        }
    }
    
    
    func startCountdownTimer() {
        let calendar = Calendar.current
        if let lastVisitDate = UserSettings.shared.lastBonusDate {
            let targetDate = calendar.date(byAdding: .day, value: 1, to: lastVisitDate)
            let now = Date()
            if targetDate != nil && now < targetDate! {
                let timeRemaining = calendar.dateComponents([.hour, .minute, .second], from: now, to: targetDate!)
                let timeString = String(format: "%02d:%02d:%02d", timeRemaining.hour ?? 0, timeRemaining.minute ?? 0, timeRemaining.second ?? 0)
                contentView.timecountLabel.text = "\(timeString)"
                Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] timer in
                    guard let self else { return }
                    if let targetDate = targetDate {
                        let now = Date()
                        if now >= targetDate {
                            UserDefaults.standard.set(now, forKey: "LastVisitDate")
                            dismiss(animated: true, completion: nil)
                            timer.invalidate()
                        } else {
                            let timeRemaining = calendar.dateComponents([.hour, .minute, .second], from: now, to: targetDate)
                            let timeString = String(format: "%02d:%02d:%02d", timeRemaining.hour ?? 0, timeRemaining.minute ?? 0, timeRemaining.second ?? 0)
                            
                            contentView.timecountLabel.text = "\(timeString)"
                        }
                    }
                }
            } else {
                UserDefaults.standard.set(now, forKey: "LastVisitDate")
            }
        }
    }
}
