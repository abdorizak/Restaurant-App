//
//  UIVIewController+Extention.swift
//  Resturant App
//
//  Created by Abdirizak Hassan on 9/27/21.
//

import UIKit

extension UIViewController {
    static var identifier: String {
        return String(describing: self)
    }
    
    static func instantiate() -> Self {
        let storyboard  = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: identifier) as! Self
        return controller
    }
}
