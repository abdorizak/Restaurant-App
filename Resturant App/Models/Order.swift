//
//  Order.swift
//  Resturant App
//
//  Created by Abdirizak Hassan on 9/29/21.
//

import Foundation

struct Order: Decodable {
    let id: String?
    let name: String?
    let dish: Dish?
}
