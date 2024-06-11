//
//  HorizontalFoodsCells.swift
//  FoodDeliveryMain
//
//  Created by Sardorbek Saydamatov on 05/06/24.
//

import UIKit
import SnapKit

class HorizontalFoodsCell: UICollectionViewCell {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        label.textAlignment = .center
        label.preferredMaxLayoutWidth = 200
        return label
    }()
    
    private let imageView: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.layer.cornerRadius = 35
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureData(title: String, imageTitle: String) {
        self.titleLabel.text = title
        self.imageView.image = UIImage(named: imageTitle)
    }
    
    func setUpConstraints() {
        
        contentView.addSubview(titleLabel, imageView)
        
        let commonConstraints = 10
        
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(commonConstraints)
            make.leading.equalToSuperview().offset(commonConstraints)
            make.size.equalTo(70)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(commonConstraints)
            make.leading.equalToSuperview().offset(commonConstraints)
            make.trailing.equalToSuperview().offset(-commonConstraints)
        }
    }

}

