//
//  TimeNextBonusVC.swift
//  LuckyRabbit


import UIKit
import SnapKit

class TimeNextBonusVC: UIViewController {
    
    
     var contentView: TimeNextBonusView {
        view as? TimeNextBonusView ?? TimeNextBonusView()
    }
    
    override func loadView() {
        view = TimeNextBonusView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }

}

extension TimeNextBonusVC {
   
    func startCountdownTimer() {
        let calendar = Calendar.current
        if let lastVisitDate = UserSettings.shared.lastBonusDate {
            let targetDate = calendar.date(byAdding: .day, value: 1, to: lastVisitDate)
            let now = Date()
            if targetDate != nil && now < targetDate! {
                let timeRemaining = calendar.dateComponents([.hour, .minute, .second], from: now, to: targetDate!)
                let timeString = String(format: "%02d:%02d:%02d", timeRemaining.hour ?? 0, timeRemaining.minute ?? 0, timeRemaining.second ?? 0)
                contentView.timeLabel.text = "\(timeString)"
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
                            
                            contentView.timeLabel.text = "\(timeString)"
                        }
                    }
                }
            } else {
                UserDefaults.standard.set(now, forKey: "LastVisitDate")
            }
        }
    }
}
