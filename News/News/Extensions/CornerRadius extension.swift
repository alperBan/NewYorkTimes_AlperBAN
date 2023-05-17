//
//  CornerRadius extension.swift
//  News
//
//  Created by Alper Ban on 17.05.2023.
//

import UIKit
extension UIView{
    @IBInspectable var cornerRadius : CGFloat{
       get { return cornerRadius}
        set{
            self.layer.cornerRadius = newValue
        }
    }
}
