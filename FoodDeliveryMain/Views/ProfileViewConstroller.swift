//
//  ProfileViewConstroller.swift
//  FoodDeliveryMain
//
//  Created by Sardorbek Saydamatov on 11/06/24.
//

import UIKit
import SnapKit

class ProfileViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    private let items: [ItemModel] = [
        ItemModel(title: "Profile information"),
        ItemModel(title: "Order History"),
        ItemModel(title: "Location"),
        ItemModel(title: "Payment Method"),
        ItemModel(title: "Gift Vaucher"),
        ItemModel(title: "Push notification"),
        ItemModel(title: "Refer a friend"),
        ItemModel(title: "Contact us"),
        ItemModel(title: "Logout"),
    ]
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout )
        collectionView.backgroundColor = .systemBackground
        collectionView.allowsSelection = false
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(ProfileHeaderCell.self, forCellWithReuseIdentifier: "ProfileHeaderCell")
        collectionView.register(BodyCell.self, forCellWithReuseIdentifier: "BodyCell")
        title = "Profile"
        
        view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension ProfileViewController {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count + 1
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row == 0 {
            return CGSize(width: collectionView.bounds.width, height: 100)
        } else {
            return CGSize(width: collectionView.bounds.width, height: 60)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProfileHeaderCell", for: indexPath) as? ProfileHeaderCell
            else {
                fatalError("Error to dequeue ProfileHeaderCell")
            }
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BodyCell", for: indexPath) as? BodyCell
            else {
                fatalError("Error to dequeue \(items[indexPath.row - 1].title)")
            }
            cell.configure(titleLabel: items[indexPath.row - 1].title, switcher: indexPath.row == 6 ? false : true, divider: indexPath.row == 5 || indexPath.row == 7 ? false : true)
            return cell
        }
    }
}

