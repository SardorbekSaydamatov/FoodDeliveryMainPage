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
    
    private let todayMealLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.text = "Today's meal"
        label.textColor = .black
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
        contentView.addSubview(collectionView, todayMealLabel)
        let commonConstraints = 10
        
        todayMealLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(-20)
            make.leading.equalToSuperview().offset(commonConstraints)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(todayMealLabel).offset(10)
            make.height.equalTo(100)
            make.width.equalToSuperview()
           // make.bottom.equalToSuperview()
        }
    }
}

// MARK: - TodaysMealCell Extensions

extension TodaysMealCell: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 100)
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
