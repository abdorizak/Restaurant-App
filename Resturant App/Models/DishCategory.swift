//
//  DishCategory.swift
//  Resturant App
//
//  Created by Abdirizak Hassan on 9/19/21.
//

import Foundation


struct DishCategory: Decodable {
    let id, name, image: String?
    
    enum CodingKeys:String, CodingKey {
        case name = "title", id , image
    }
}
