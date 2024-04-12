//
//  MenuList.swift
//  Little Lemon
//
//  Created by Guy Steinberg on 12/04/2024.
//

import Foundation
import CoreData

struct MenuList : Decodable {
    let menu: [MenuItem]
    
    static func getMenuData(viewContext: NSManagedObjectContext) {
        PersistenceController.shared.clear()
        
        let littleLemonMenuJsonDataUrl = URL(string: "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json")!
        
        let menuItemsJsonRequest = URLRequest(url: littleLemonMenuJsonDataUrl)
        
        let parseJsonTask = URLSession.shared.dataTask(with: menuItemsJsonRequest) { data, response, err in
            if let menuDataJson = data {
                let decoder = JSONDecoder()
                do {
                    let menuItems = try decoder.decode(MenuList.self, from: menuDataJson)
                    menuItems.menu.forEach { item in
                        let dish = Dish(context: viewContext)
                        dish.title = item.title
                        dish.price = Float(item.price) ?? 0.0
                        dish.image = item.image
                        dish.info = item.dishDescription
                        dish.category = item.category
                    }
                    try viewContext.save()
                } catch {
                    print("\(error)")
                }
            }
        }
        parseJsonTask.resume()
    }
}


