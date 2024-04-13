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
    @State var searchText = ""
    var body: some View {
        VStack() {
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
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("Search menu", text: $searchText)
            }.padding(5)
            FetchedObjects(sortDescriptors: buildSortDescriptors()) { (dishes : [Dish]) in
                List {
                    ForEach(dishes) { dish in
                        DishItem(dish: dish)
                    }
                }.listStyle(.plain)
            }
        }
        .onAppear() {
            MenuList.getMenuData(viewContext: viewContext)
        }
    }
    
    func buildSortDescriptors() -> [NSSortDescriptor] {
        return [
            NSSortDescriptor(key: "title", ascending: true, selector: #selector(NSString.localizedStandardCompare))
        ]
    }
}

#Preview {
    MenuPage().environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
}
