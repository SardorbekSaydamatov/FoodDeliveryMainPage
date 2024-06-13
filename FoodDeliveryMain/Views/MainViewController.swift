//
//  ViewController.swift
//  FoodDeliveryMain
//
//  Created by Sardorbek Saydamatov on 05/06/24.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    var cellsModel: [CellsModel] = [.HeaderCell, .DateCell, .TodaysMealCell]
    
    private let foods: [FoodModel] = [
        FoodModel(title: "Snacks", imageName: "soup"),
        FoodModel(title: "Breakfast", imageName: "plov"),
        FoodModel(title: "Lunch", imageName: "lagman"),
        FoodModel(title: "Dinner", imageName: "chuchvara"),
        FoodModel(title: "Sweets", imageName: "kebab"),
        FoodModel(title: "National", imageName: "lavash"),
        FoodModel(title: "International", imageName: "somsa")
    ]
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = .systemBackground
        collection.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 65, right: 10)
        collection.showsVerticalScrollIndicator = false
        return collection
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(HeaderCell.self, forCellWithReuseIdentifier: "HeaderCell")
        collectionView.register(DateCell.self, forCellWithReuseIdentifier: "DateCell")
        collectionView.register(TodaysMealCell.self, forCellWithReuseIdentifier: "TodaysMealCell")
        collectionView.register(FoodCartsCell.self, forCellWithReuseIdentifier: "FoodCartsCell")
        
        setUpConstraints()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
        
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

    func setUpConstraints() {
        view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

// MARK: - MainViewController Extensions

extension MainViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            return CGSize(width: collectionView.bounds.width, height: 130)
        } else {
            return CGSize(width: collectionView.bounds.width / 2 - 20, height: 250)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            cellsModel.count
        } else {
            foods.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            if cellsModel.indices.contains(indexPath.row) {
                let cellType = cellsModel[indexPath.row]
                
                switch cellType {
                case .HeaderCell:
                    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HeaderCell", for: indexPath) as? HeaderCell else {
                        fatalError("Cannot dequeue HeaderCell")
                    }
                    return cell
                case .DateCell:
                    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DateCell", for: indexPath) as? DateCell else {
                        fatalError("Cannot dequeue DateCell")
                    }
                    return cell
                case .TodaysMealCell:
                    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TodaysMealCell", for: indexPath) as? TodaysMealCell else {
                        fatalError("Cannot dequeue TodaysMealCell")
                    }
                    return cell
                }
            } else {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DefaultCell", for: indexPath)
                return cell
            }
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FoodCartsCell", for: indexPath) as? FoodCartsCell else {
                fatalError("Cannot dequeue FoodCartsCell")
            }
            cell.configureData(title: foods[indexPath.row].title, imageTitle: foods[indexPath.row].imageName)
            return cell
        }
    } 
}

