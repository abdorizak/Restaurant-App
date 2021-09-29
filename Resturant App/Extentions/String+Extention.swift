//
//  String+Extention.swift
//  Resturant App
//
//  Created by Abdirizak Hassan on 9/19/21.
//

import Foundation

extension String {
    var asUrl: URL? {
        return URL(string: self)
    }
}
