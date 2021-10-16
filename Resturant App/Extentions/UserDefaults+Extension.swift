//
//  UserDefaults+Extension.swift
//  Resturant App
//
//  Created by Abdirizak Hassan on 10/16/21.
//

import Foundation


extension UserDefaults {
    private enum userDefaultsKeys: String {
        case hasOnboarded
    }
    
    var hasOnboarded: Bool {
        get {
            bool(forKey: userDefaultsKeys.hasOnboarded.rawValue)
        }
        set {
            setValue(newValue, forKey: userDefaultsKeys.hasOnboarded.rawValue)
        }
    }
}
