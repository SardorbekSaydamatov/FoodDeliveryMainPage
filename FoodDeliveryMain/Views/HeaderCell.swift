//
//  HeaderCellCollectionViewCell.swift
//  FoodDeliveryMain
//
//  Created by Sardorbek Saydamatov on 05/06/24.
//

import UIKit
import SnapKit

class HeaderCell: UICollectionViewCell {
    
    private let filterButton: UIButton = {
        let button = UIButton(type: .system)
        let image = UIImage(systemName: "cursorarrow.motionlines")
        button.setImage(image, for: .normal)
        button.tintColor = .white
        return button
    }()
    
    private var containerView: UIView = {
        let container = UIView()
        container.layer.cornerRadius = 5
        container.backgroundColor = UIColor(red: 167/255.0, green: 214/255.0, blue: 140/255.0, alpha: 1.0)
        return container
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        let attributedString = NSMutableAttributedString(string: "Good Afternoon, Sardorbek!")
        attributedString.addAttribute(.foregroundColor, value: UIColor(red: 167/255.0, green: 214/255.0, blue: 140/255.0, alpha: 1.0), range: NSRange(location: 16, length: 10))
        label.attributedText = attributedString
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        label.text = "Choose the right meal for you"
        return label
    }()
    
    private let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Search lunch, dishes"
        searchBar.searchBarStyle = .minimal
        return searchBar
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpConstraints() {
        contentView.addSubview(titleLabel, subtitleLabel, searchBar, containerView)
        containerView.addSubview(filterButton)
        let commonConstraints = 15
        let commonConstraints2 = 10
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(commonConstraints)
            make.horizontalEdges.equalToSuperview().offset(commonConstraints)
        }
        
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(commonConstraints2)
            make.horizontalEdges.equalToSuperview().offset(commonConstraints)
        }
        
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(subtitleLabel.snp.bottom).offset(commonConstraints2)
            make.leading.equalToSuperview().offset(8)
            make.trailing.equalToSuperview().offset(-80)
        }
        
        containerView.snp.makeConstraints { make in
            make.top.equalTo(subtitleLabel.snp.bottom).offset(commonConstraints)
            make.leading.equalTo(searchBar.snp.trailing).offset(commonConstraints)
            make.size.equalTo(40)
        }
        
        filterButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
            make.leading.equalToSuperview().offset(5)
            make.trailing.equalToSuperview().offset(-5)
            make.bottom.equalToSuperview().offset(-5)
        }
    }
}
