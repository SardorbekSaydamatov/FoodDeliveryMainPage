//
//  DateCell.swift
//  FoodDeliveryMain
//
//  Created by Sardorbek Saydamatov on 05/06/24.
//

import UIKit
import SnapKit

class DateCell: UICollectionViewCell {
    
    var selectedIndex: IndexPath?
    
    private let dates: [DateModel] = [
        DateModel(weekName: "SUN", date: 23, isSeleted: false),
        DateModel(weekName: "MON", date: 24, isSeleted: false),
        DateModel(weekName: "TUE", date: 25, isSeleted: false),
        DateModel(weekName: "WED", date: 26, isSeleted: false),
        DateModel(weekName: "THU", date: 27, isSeleted: false),
        DateModel(weekName: "FRI", date: 28, isSeleted: false),
        DateModel(weekName: "SAT", date: 29, isSeleted: false)
    ]
    
    private let dateTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.text = "Serving this Month"
        label.textColor = .black
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        label.text = "23-29 Jan(7days"
        label.textColor = UIColor(red: 167/255.0, green: 214/255.0, blue: 140/255.0, alpha: 1.0)
        return label
    }()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemBackground
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(SelectableDateCell.self, forCellWithReuseIdentifier: "SelectableDateCell")
        
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpConstraints() {
        contentView.addSubview(collectionView, dateTitleLabel, dateLabel)
        let commonConstraints = 10
        
        dateTitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(commonConstraints)
            make.leading.equalToSuperview().offset(commonConstraints)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(commonConstraints)
            make.trailing.equalToSuperview().offset(-commonConstraints)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(dateTitleLabel.snp.bottom).offset(5)
            make.height.equalTo(80)
            make.width.equalToSuperview()
        }
    }
}

// MARK: - DateCell Extensions

extension DateCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: collectionView.bounds.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dates.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if dates.indices.contains(indexPath.row) {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SelectableDateCell", for: indexPath) as? SelectableDateCell
            else {
                fatalError("dates array is empty")
            }
            cell.dataConfigure(weekName: dates[indexPath.row].weekName, dateLabel: dates[indexPath.row].date)
            cell.layer.cornerRadius = 5
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DefaultCell", for: indexPath)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let selectedIndex = selectedIndex, indexPath == selectedIndex {
            collectionView.deselectItem(at: indexPath, animated: false)
            self.selectedIndex = nil
            return
        }
        selectedIndex = indexPath
        
    }
}
