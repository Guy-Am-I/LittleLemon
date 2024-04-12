//
//  MenuItem.swift
//  Little Lemon
//
//  Created by Guy Steinberg on 12/04/2024.
//

import Foundation

struct MenuItem: Decodable {
    
    let title: String
    let image: String
    let price: String
    let dishDescription: String
    let category: String
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case image = "image"
        case price = "price"
        case category = "category"
        case dishDescription = "description"
    }
}



