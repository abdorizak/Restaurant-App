//
//  Dish.swift
//  Resturant App
//
//  Created by Abdirizak Hassan on 9/20/21.
//

import Foundation

struct Dish: Decodable {
    let id, name, description, image: String?
    let calories: Int?
    
    var formattedCalories: String {
        return "\(calories ?? 0) calories"
    }
}
