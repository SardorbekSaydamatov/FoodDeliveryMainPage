//
//  FoodCartsCell.swift
//  FoodDeliveryMain
//
//  Created by Sardorbek Saydamatov on 05/06/24.
//

import UIKit

class FoodCartsCell: UICollectionViewCell {
    
    private let constainer: UIView = {
        let container = UIView()
        container.backgroundColor = .gray.withAlphaComponent(0.3)
        return container
    }()
    
    private let imageView: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.layer.cornerRadius = 50
        return image
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        label.textAlignment = .center
        label.preferredMaxLayoutWidth = 200
        return label
    }()
    
    private let rateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 8, weight: .light)
        label.textColor = .black
        label.text = "⭐️4.8"
        return label
    }()
    
    private let caloryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 8, weight: .light)
        label.textColor = .black
        label.text = "🔥150 Kcal"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureData(title: String, imageTitle: String) {
        self.titleLabel.text = title
        self.imageView.image = UIImage(named: imageTitle)
    }
    
    func setUpConstraints() {
        contentView.addSubview(constainer)
        constainer.addSubview( rateLabel, caloryLabel, titleLabel, imageView)
        
        constainer.snp.makeConstraints { make in
            make.verticalEdges.equalToSuperview()
            make.leading.equalToSuperview().offset(5)
            make.trailing.equalToSuperview().offset(-5)
            
        }
        
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(-20)
            make.leading.equalToSuperview().offset(10)
            make.size.equalTo(100)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(10)
        }
        
        rateLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel).offset(10)
            make.leading.equalToSuperview().offset(10)
            make.bottom.equalTo(constainer.snp.bottom).offset(-10)
        }
        
        caloryLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel).offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.bottom.equalTo(constainer.snp.bottom).offset(-10)
        }
    }
}
