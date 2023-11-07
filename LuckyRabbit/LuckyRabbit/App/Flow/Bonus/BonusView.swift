//
//  BonusView.swift
//  LuckyRabbit




import UIKit
import SnapKit

class BonusView: UIView {
    
    private(set)  var backgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "backBG")
        return imageView
    }()
    
    private (set) var spinButton: UIButton = {
        let button = UIButton()
        button.setTitle("SPIN BUTTON", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .yellow
        button.titleLabel?.font = UIFont(name: "Inter-Bold", size: 20)
        button.layer.cornerRadius = 12
        return button
    }()
    
    private(set)  var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "Inter-Black", size: 60)
        label.text = "Get daily \nbonus"
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private(set)  var timerView: UIView = {
        let view = UIView()
        view.isHidden = true
        view.backgroundColor = .red
        return view
    }()
    
    private(set)  var backgroundTimeImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "backTimeBonusBg")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private(set)  var titleTimeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "Inter-Regular", size: 20)
        label.text = "Time to next spin"
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private(set) lazy var timecountLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont(name: "Inter-Black", size: 60)
        return label
    }()
    
    let sector = SlotAnimateView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setUpConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        [backgroundImage,sector,spinButton,titleLabel,timerView].forEach(addSubview(_:))
        
        timerView.addSubview(backgroundTimeImage)
        timerView.addSubview(titleTimeLabel)
        timerView.addSubview(timecountLabel)
        
    }
    
    private func setUpConstraints(){
        
        timerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        backgroundTimeImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        titleTimeLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(60)
        }
        
        timecountLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(titleTimeLabel.snp.bottom).offset(12)
        }
        
        backgroundImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(12)
            make.left.right.equalToSuperview().inset(54)
        }
        
        sector.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(46)
            make.centerY.equalToSuperview()
            make.height.equalTo(sector.snp.width)
        }
        
        spinButton.snp.makeConstraints { make in
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-60)
            make.left.right.equalToSuperview().inset(24)
            make.height.equalTo(spinButton.snp.width).multipliedBy(0.16)
        }
    }
}
