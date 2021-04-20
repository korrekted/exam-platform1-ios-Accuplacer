//
//  PaygateOptionView.swift
//  SleepWell
//
//  Created by Andrey Chernyshev on 12/06/2020.
//  Copyright © 2020 Andrey Chernyshev. All rights reserved.
//

import UIKit

final class PaygateOptionView: UIView {
    lazy var checkedImageView = makeCheckedImageView()
    lazy var titleLabel = makeLabel()
    lazy var captionLabel = makeLabel()
    lazy var subCaptionLabel = makeLabel()
    lazy var saveLabel = makeSaveLabel()
    lazy var bottomLabel = makeLabel()
    
    var isSelected = false {
        didSet {
            updateColors()
        }
    }
    
    private(set) var productId: String?
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        makeConstraints()
        updateColors()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(option: PaygateOption) {
        self.productId = option.productId
        
        updateContent(at: option)
        updateColors()
    }
}

// MARK: Private
private extension PaygateOptionView {
    func updateContent(at option: PaygateOption) {
        titleLabel.attributedText = option.title
        captionLabel.attributedText = option.caption
        subCaptionLabel.attributedText = option.subCaption
        
        saveLabel.attributedText = option.save
        saveLabel.isHidden = option.save == nil
        
        bottomLabel.attributedText = option.bottomLine
    }
    
    func updateColors() {
        backgroundColor = isSelected ? .white : .clear
        
        checkedImageView.isHidden = !isSelected
    
        layer.borderWidth = 2.scale
        layer.borderColor = isSelected ? UIColor(integralRed: 198, green: 54, blue: 136).cgColor : UIColor(integralRed: 17, green: 17, blue: 17).cgColor
        
        titleLabel.textColor = UIColor(integralRed: 17, green: 17, blue: 17)
        captionLabel.textColor = UIColor(integralRed: 17, green: 17, blue: 17)
        subCaptionLabel.textColor = UIColor(integralRed: 17, green: 17, blue: 17)
        bottomLabel.textColor = UIColor(integralRed: 17, green: 17, blue: 17)
        
        saveLabel.textColor = UIColor.white
        saveLabel.backgroundColor = UIColor(integralRed: 198, green: 54, blue: 136)
    }
}

// MARK: Make constraints
private extension PaygateOptionView {
    func makeConstraints() {
        NSLayoutConstraint.activate([
            checkedImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10.scale),
            checkedImageView.widthAnchor.constraint(equalToConstant: 30.scale),
            checkedImageView.heightAnchor.constraint(equalToConstant: 30.scale),
            checkedImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10.scale)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12.scale),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 35.scale)
        ])
        
        NSLayoutConstraint.activate([
            captionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12.scale),
            captionLabel.topAnchor.constraint(equalTo: topAnchor, constant: 62.scale)
        ])
        
        NSLayoutConstraint.activate([
            subCaptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12.scale),
            subCaptionLabel.topAnchor.constraint(equalTo: topAnchor, constant: 92.scale)
        ])
        
        NSLayoutConstraint.activate([
            saveLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12.scale),
            saveLabel.topAnchor.constraint(equalTo: topAnchor, constant: 113.scale)
        ])
        
        NSLayoutConstraint.activate([
            bottomLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12.scale),
            bottomLabel.topAnchor.constraint(equalTo: topAnchor, constant: 148.scale)
        ])
    }
}

// MARK: Lazy initialization
private extension PaygateOptionView {
    func makeCheckedImageView() -> UIImageView {
        let view = UIImageView()
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFit
        view.image = UIImage(named: "Paygate.MainOffer.Checked")
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }
    
    func makeLabel() -> UILabel {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }
    
    func makeSaveLabel() -> PaddingLabel {
        let view = PaddingLabel()
        view.bottomInset = 1.scale
        view.topInset = 1.scale
        view.leftInset = 6.scale
        view.rightInset = 6.scale
        view.textAlignment = .center
        view.layer.cornerRadius = 4.scale
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }
}
