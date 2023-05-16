//
//  UICollectionViewCell+Extension.swift
//  News
//
//  Created by Alper Ban on 16.05.2023.
//

import Foundation
import UIKit

extension UICollectionViewCell {
    
    static var identifier: String {
        return String(describing: self)
    }
    
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
}
