//
//  UIView+Extention.swift
//  Resturant App
//
//  Created by Abdirizak Hassan on 9/19/21.
//

import Foundation

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get{ return self.cornerRadius }
        set {
            self.layer.cornerRadius = newValue
            
        }
    }
}
