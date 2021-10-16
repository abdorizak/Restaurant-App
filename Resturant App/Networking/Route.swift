//
//  Route.swift
//  Resturant App
//
//  Created by Abdirizak Hassan on 9/29/21.
//

import Foundation

enum Route {
    static let baseUrl = "https://yummie.glitch.me"
    
    case fetchAllCategories
    case placeOrder(String)
    
    var description: String {
        switch self {
        case .fetchAllCategories: return "/dish-categories"
        case .placeOrder(let dishId): return "/orders/\(dishId)"
        }
    }
}
