//
//  SelectableDateCell.swift
//  FoodDeliveryMain
//
//  Created by Sardorbek Saydamatov on 05/06/24.
//

import UIKit
import SnapKit

class SelectableDateCell: UICollectionViewCell {
    
    private let weekName: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .gray.withAlphaComponent(0.2)
        
        setUpConstraints()
    }
    
    override var isSelected: Bool {
        didSet {
            backgroundColor = isSelected ? UIColor(red: 167/255.0, green: 214/255.0, blue: 140/255.0, alpha: 1.0) : .gray.withAlphaComponent(0.2)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func dataConfigure(weekName: String, dateLabel: Int) {
        self.weekName.text = weekName
        self.dateLabel.text = "\(dateLabel)"
    }
    
    func setUpConstraints() {
        
        contentView.addSubview(weekName, dateLabel)
        
        weekName.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(13)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(weekName).offset(20)
            make.leading.equalToSuperview().offset(16)
        }
    }
}
