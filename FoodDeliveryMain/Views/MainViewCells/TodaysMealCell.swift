//
//  TodaysMealCell.swift
//  FoodDeliveryMain
//
//  Created by Sardorbek Saydamatov on 05/06/24.
//

import UIKit
import SnapKit

class TodaysMealCell: UICollectionViewCell {
    
    private let foods: [FoodModel] = [
        FoodModel(title: "Snacks", imageName: "soup"),
        FoodModel(title: "Breakfast", imageName: "plov"),
        FoodModel(title: "Lunch", imageName: "lagman"),
        FoodModel(title: "Dinner", imageName: "chuchvara"),
        FoodModel(title: "Sweets", imageName: "kebab"),
        FoodModel(title: "National", imageName: "lavash"),
        FoodModel(title: "International", imageName: "somsa")
    ]
    
    private let popularNowLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.text = "Popular now"
        label.textColor = .label
        return label
    }()
    
    let seeAllButton: UIButton = {
        let button = UIButton(type: .system)
        let title = "See all"
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.gray,
            .underlineStyle: NSUnderlineStyle.single.rawValue
        ]
        let attributedTitle = NSAttributedString(string: title, attributes: attributes)
        button.setAttributedTitle(attributedTitle, for: .normal)
        return button
    }()

    
    private let todayMealLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.text = "Today's meal"
        label.textColor = .label
        return label
    }()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout )
        collectionView.backgroundColor = .systemBackground
        collectionView.allowsSelection = false
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(HorizontalFoodsCell.self, forCellWithReuseIdentifier: "HorizontalFoodsCell")
        
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpConstraints() {
        contentView.addSubview(collectionView, todayMealLabel, popularNowLabel, seeAllButton)
        let commonConstraints = 10
        
        todayMealLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(-15)
            make.leading.equalToSuperview().offset(commonConstraints)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(todayMealLabel).offset(30)
            make.height.equalTo(150)
            make.width.equalToSuperview()
            make.bottom.equalToSuperview().offset(-commonConstraints)
        }
        
        popularNowLabel.snp.makeConstraints { make in
            make.top.equalTo(collectionView.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(commonConstraints)
        }
        
        seeAllButton.snp.makeConstraints { make in
            make.top.equalTo(collectionView.snp.bottom).offset(10)
            make.trailing.equalTo(-commonConstraints)
        }
    }
}

// MARK: - TodaysMealCell Extensions

extension TodaysMealCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: 120)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return foods.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if foods.indices.contains(indexPath.row) {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HorizontalFoodsCell", for: indexPath) as? HorizontalFoodsCell
            else {
                fatalError("dates array is empty")
            }
            cell.configureData(title: foods[indexPath.row].title, imageTitle: foods[indexPath.row].imageName)
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DefaultCell", for: indexPath)
            return cell
        }
    }
}
