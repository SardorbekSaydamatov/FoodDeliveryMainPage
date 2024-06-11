//
//  BodyCell.swift
//  FoodDeliveryMain
//
//  Created by Sardorbek Saydamatov on 11/06/24.
//

import UIKit
import SnapKit

class BodyCell: UICollectionViewCell {
    
    private let titleLabel: UILabel = {
       let lbl = UILabel()
        lbl.textColor = .label
        lbl.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        lbl.textAlignment = .left
       return lbl
    }()
    
    private let chevronImage: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(systemName: "chevron.right")
        img.tintColor = .black
        return img
    }()
    
    private let switcher: UISwitch = {
        let switcher = UISwitch()
        switcher.isOn = false
        switcher.transform = CGAffineTransform(scaleX: 0.70, y: 0.65)
        return switcher
    }()
    
    private let divider: UIView = {
        let divider = UIView()
        divider.backgroundColor = .gray.withAlphaComponent(0.2)
        return divider
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpSubView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(titleLabel: String, switcher: Bool, divider: Bool) {
        self.titleLabel.text = titleLabel
        self.divider.isHidden = divider
        self.switcher.isHidden = switcher
        
        if switcher == false {
            chevronImage.isHidden = true
        }
    }
    
    func setUpSubView() {
        contentView.addSubview(titleLabel, chevronImage, switcher, divider)
        
        let commonConstraint = 20
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(40)
            make.leading.equalToSuperview().offset(commonConstraint)
        }
        
        chevronImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(commonConstraint * 2)
            make.trailing.equalToSuperview().offset(-commonConstraint)
            make.height.equalTo(14)
            make.width.equalTo(7)
        }
        
        switcher.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(commonConstraint * 2)
            make.trailing.equalToSuperview().offset(-commonConstraint)
        }
        
        divider.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.bottom).offset(commonConstraint)
            make.leading.equalToSuperview().offset(commonConstraint)
            make.trailing.equalToSuperview().offset(-commonConstraint)
            make.height.equalTo(1)
        }
    }

}
