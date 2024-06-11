//
//  ProfileHeaderCell.swift
//  FoodDeliveryMain
//
//  Created by Sardorbek Saydamatov on 11/06/24.
//

import UIKit
import SnapKit

class ProfileHeaderCell: UICollectionViewCell {
    
    private let containerView: UIView = {
        let ctr = UIView()
        ctr.backgroundColor = UIColor(red: 167/255.0, green: 214/255.0, blue: 140/255.0, alpha: 1.0)
        return ctr
    }()
    
    private let greetLabel: UILabel =  {
        let lbl = UILabel()
        lbl.text = "Hi Sardorbek,"
        lbl.textColor = .white
        lbl.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return lbl
    }()
    
    private let emailLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "sardorbek.saydamatov@mail.ru"
        lbl.textColor = .white
        lbl.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        return lbl
    }()
    
    private let profileImage: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(systemName: "person.fill")
        img.tintColor = .gray
        return img
    }()
    
    private let imgContainer: UIView = {
        let ctr = UIView()
        ctr.layer.cornerRadius = 23
        ctr.backgroundColor = UIColor(red: 252/255.0, green: 242/255.0, blue: 235/255.0, alpha: 1)
        return ctr
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubviews() {
        contentView.addSubview(containerView)
        imgContainer.addSubview(profileImage)
        containerView.addSubview(greetLabel, emailLabel, imgContainer)
        containerView.layer.cornerRadius = 10
        
        containerView.snp.makeConstraints { make in
            make.verticalEdges.equalToSuperview()
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-15)
        }
        
        greetLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(30)
            make.leading.equalToSuperview().offset(20)
        }
        
        emailLabel.snp.makeConstraints { make in
            make.top.equalTo(greetLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(20)
        }
        
        imgContainer.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-20)
            make.size.equalTo(45)
        }
        
        profileImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
            make.leading.equalToSuperview().offset(5)
            make.trailing.equalToSuperview().offset(-5)
            make.bottom.equalToSuperview().offset(-5)
        }
    }
}
