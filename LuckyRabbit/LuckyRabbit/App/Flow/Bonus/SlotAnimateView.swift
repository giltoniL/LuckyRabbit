//
//  SlotAnimateView.swift
//  LuckyRabbit


import UIKit
import SnapKit

class SlotAnimateView: UIView {
    
    let gradientView = GradientView()
    
    private(set)  var sectordImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "frameSector")
        return imageView
    }()
    
    var labels: [UILabel] = []
    
    private(set)  var numberLabel: UILabel = {
        let label = UILabel()
        label.text = "5"
        label.textColor = .white
        label.font = UIFont(name: "Inter-Black", size: 24)
        label.textAlignment = .center
        return label
    }()
    
    
    private(set)  var numberoneLabel: UILabel = {
        let label = UILabel()
        label.text = "10"
        label.textColor = .white
        label.font = UIFont(name: "Inter-Black", size: 24)
        label.textAlignment = .center
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
        setupUI()
        setUpConstraints()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        renderLabels()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(sectordImage)
        addSubview(gradientView)
        gradientView.setupLayer(view: self)
        createLabels()
        
        
    }
    
    private func setUpConstraints(){
        
        sectordImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        gradientView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    
    func createLabels() {
        for index in 0..<300 {
            
            let label = UILabel()
            let randomNumber = [0, 5, 10, 15].randomElement() ?? 0
            label.text = String(randomNumber)
            label.textColor = .white
            label.font = UIFont(name: "Inter-Black", size: 24)
            label.textAlignment = .center
            addSubview(label)
            labels.append(label)
            let y = index / 5
            if y == 2 {
                label.textColor = .yellow
            }
        }
        
    }
    
    func renderLabels() {
        let size: CGFloat = frame.width / 5
        
        for index in 0..<labels.count {
            let label = labels[index]
            let x = CGFloat(index % 5)
            let y = CGFloat(index / 5)
            label.frame = .init(x: x * size, y: y * size, width: size, height: size)
            
        }
    }
    
    func spinLabels(completion: (() -> Void)? = nil) {
        let container = UIView()
        addSubview(container)
        
        for (index, label) in labels.enumerated() {
            container.addSubview(label)
            label.frame.origin.y = CGFloat(index / 5) * label.frame.size.height
        }
        
        let animation = CAKeyframeAnimation(keyPath: "position.y")
        let startY = -2500
        let endY = labels.first?.frame.origin.y ?? 0
        animation.values = [startY, endY]
        animation.keyTimes = [0, 1.0]
        animation.duration = 3
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        animation.repeatCount = 1
        container.layer.add(animation, forKey: "spinAnimation")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
            completion?()
        }
    }
    
}
