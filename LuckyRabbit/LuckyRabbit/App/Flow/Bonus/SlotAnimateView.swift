//
//  SlotAnimateView.swift
//  LuckyRabbit


import UIKit
import SnapKit

class SlotAnimateView: UIView {
    
    let gradientView = GradientView()
    let arrayOne: [String] =  ["5","5","5","0","0"]
    let arrayTwo: [String] =  ["10","10","10","0","0"]
    let arrayThree: [String] =  ["15","15","15","0","0"]
    var score = 0
    var total = 0
    var selectedArray: [String] = []
    
    
    private(set)  var sectordImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "frameSector")
        return imageView
    }()
    
    var labels: [UILabel] = []
    
    
    
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
        let arraysCount: [[String]] = [arrayOne, arrayTwo, arrayThree]
        selectedArray = arraysCount.randomElement() ?? []
        switch selectedArray {
        case arrayOne:
            total = 5
        case arrayTwo:
            total = 10
        case arrayThree:
            total = 15
        default:
            break
        }
        
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
        
        for index in 10..<13 {
            self.labels[index].textColor = .yellow
        }
        
        for (index, label) in self.labels.enumerated() {
            if index / 5 == 2 {
                label.text = self.selectedArray[self.score]
                self.score = (self.score + 1) % self.selectedArray.count
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
            
            completion?()
        }
    }
    
    
}
