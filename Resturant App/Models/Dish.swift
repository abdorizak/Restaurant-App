//
//  Dish.swift
//  Resturant App
//
//  Created by Abdirizak Hassan on 9/20/21.
//

import Foundation

struct Dish {
    let id, name, description, image: String?
    let colories: Int?
    
    var formattedColories: String {
        return "\(colories ?? 0) colories"
    }
 
}
