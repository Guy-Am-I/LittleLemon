//
//  MenuPage.swift
//  Little Lemon
//
//  Created by Guy Steinberg on 12/04/2024.
//

import SwiftUI

struct MenuPage: View {
    @Environment(\.managedObjectContext) private var viewContext
    let categories = ["Starters", "Mains", "Desserts"]
    
    var body: some View {
        VStack {
            RestaurantInfo()
            ScrollView(.horizontal) {
                HStack {
                    ForEach(categories, id: \.self) {
                        Button($0) {}
                            .buttonStyle(.borderedProminent)
                            .tint(.green)
                    }
                }.padding(.leading, 20)
            }
            FetchedObjects() { (dishes : [Dish]) in
                List {
                    ForEach(dishes) { dish in
                        DishItem(dish: dish)
                    }
                }
            }
        }
        .onAppear() {
            MenuList.getMenuData(viewContext: viewContext)
        }
    }
}

#Preview {
    MenuPage().environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
}
