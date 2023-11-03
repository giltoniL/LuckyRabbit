//
//  GradientLabel.swift
//  LuckyRabbit
//
import UIKit

import UIKit

class GradientLabel: UILabel {
    
    init(text: String, fontName: String, fontSize: CGFloat) {
        super.init(frame: .zero)
        
        // Установка шрифта и размера текста
        if let font = UIFont(name: fontName, size: fontSize) {
            self.font = font
        }
        
        // Установка текста
        self.text = text
        textColor = .clear
        
        // Создаем градиентную обводку
        let gradientColors: [UIColor] = [
            UIColor(red: 1.0, green: 0.0, blue: 0.898, alpha: 1.0), // #FF00E5
            UIColor(red: 0.0, green: 1.0, blue: 0.941, alpha: 1.0), // #00FFF0
            UIColor(red: 1.0, green: 0.0, blue: 0.898, alpha: 1.0), // #FF00E5
            UIColor(red: 1.0, green: 0.961, blue: 0.0, alpha: 1.0), // #FFF500
            UIColor(red: 0.0, green: 1.0, blue: 0.941, alpha: 1.0), // #00FFF0
            UIColor(red: 1.0, green: 0.0, blue: 0.898, alpha: 1.0)  // #FF00E5
        ]
        
        let gradientText = NSMutableAttributedString(string: text)
        let range = NSRange(location: 0, length: text.count)
        
        for i in 0..<gradientColors.count {
            gradientText.addAttribute(.strokeColor, value: gradientColors[i], range: range)
            gradientText.addAttribute(.strokeWidth, value: -4, range: range)
        }
        
        self.attributedText = gradientText
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}


//class GradientLabel: UILabel {
//    
//    var gradientLayer: CAGradientLayer!
//    
//    init(text: String, fontName: String, fontSize: CGFloat) {
//        super.init(frame: .zero)
//        
//        // Установка шрифта и размера текста
//        if let font = UIFont(name: fontName, size: fontSize) {
//            self.font = font
//        }
//        
//        // Установка текста
//        self.text = text
//
//
//        // Создание градиентного слоя для обводки текста
//        gradientLayer = CAGradientLayer()
//        gradientLayer.colors = [
//            UIColor(red: 1.0, green: 0.0, blue: 0.898, alpha: 1.0).cgColor, // #FF00E5
//            UIColor(red: 0.0, green: 1.0, blue: 0.941, alpha: 1.0).cgColor, // #00FFF0
//            UIColor(red: 1.0, green: 0.0, blue: 0.898, alpha: 1.0).cgColor, // #FF00E5
//            UIColor(red: 1.0, green: 0.961, blue: 0.0, alpha: 1.0).cgColor, // #FFF500
//            UIColor(red: 0.0, green: 1.0, blue: 0.941, alpha: 1.0).cgColor, // #00FFF0
//            UIColor(red: 1.0, green: 0.0, blue: 0.898, alpha: 1.0).cgColor  // #FF00E5
//        ]
//        gradientLayer.locations = [0, 0.2, 0.4, 0.6, 0.8, 1.0]
//        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
//        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
//        
//        layer.addSublayer(gradientLayer)
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//    }
//    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        gradientLayer.frame = bounds
//    }
//}
