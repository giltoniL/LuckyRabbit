//
//  CoctailDetailsQRVC.swift
//  LuckyRabbit
//
//  Created by apple on 31.10.2023.
//

import Foundation
import UIKit

class CoctailDetailsQRVC: UIViewController {
    
    var id = ""
    
    var contentView: CoctailDetailsQRView {
        view as? CoctailDetailsQRView ?? CoctailDetailsQRView()
    }
    
    override func loadView() {
        view = CoctailDetailsQRView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let qrCodeImage = generateQRCode(from: id, size: CGSize(width: 300, height: 300)) {
            contentView.qrCodeImageView.image = qrCodeImage
        }
        
        contentView.backButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        contentView.hideButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
    }
    
    @objc func buttonTapped() {
        
        dismiss(animated: true)
    }
    
    func generateQRCode(from string: String, size: CGSize) -> UIImage? {
        if let data = string.data(using: .utf8), let qrFilter = CIFilter(name: "CIQRCodeGenerator") {
            qrFilter.setValue(data, forKey: "inputMessage")
            
            if let qrImage = qrFilter.outputImage {
                let extent = qrImage.extent
                let scaleX = size.width / extent.size.width
                let scaleY = size.height / extent.size.height
                let transformedImage = qrImage.transformed(by: CGAffineTransform(scaleX: scaleX, y: scaleY))
                
                if let cgImage = CIContext().createCGImage(transformedImage, from: transformedImage.extent) {
                    return UIImage(cgImage: cgImage)
                }
            }
        }
        
        return nil
    }
}
