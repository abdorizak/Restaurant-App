//
//  ApiResponse.swift
//  Resturant App
//
//  Created by Abdirizak Hassan on 10/3/21.
//

import Foundation

struct ApiResponse<T: Decodable>: Decodable {
    let status: Int
    let message: String?
    let data: T?
    let error: String?
}
