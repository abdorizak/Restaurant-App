//
//  AllDishes.swift
//  Resturant App
//
//  Created by Abdirizak Hassan on 10/3/21.
//

import Foundation

struct AllDishes: Decodable {
    let categories: [DishCategory]?
    let populars: [Dish]?
    let specials: [Dish]?
}
