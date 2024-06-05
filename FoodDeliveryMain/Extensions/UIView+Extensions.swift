//
//  UIView+Extensions.swift
//  FoodDeliveryMain
//
//  Created by Sardorbek Saydamatov on 05/06/24.
//

import Foundation
import UIKit

extension UIView {
    func addSubview(_ views: UIView...) {
        views.forEach { addSubview($0) }
    }
}
