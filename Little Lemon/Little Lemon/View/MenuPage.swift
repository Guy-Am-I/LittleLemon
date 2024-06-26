//
//  MenuPage.swift
//  Little Lemon
//
//  Created by Guy Steinberg on 12/04/2024.
//

import SwiftUI

struct MenuPage: View {
    @Environment(\.managedObjectContext) private var viewContext
    let categories = ["Starters", "Mains", "Desserts", "Drinks"]
    @State var searchText = ""
    @State var showAlert = false
    
    var body: some View {
        VStack() {
            RestaurantInfo()
            ScrollView(.horizontal) {
                HStack {
                    ForEach(categories, id: \.self) {
                        Button($0) {showAlert = true}
                            .buttonStyle(.borderedProminent)
                            .background()
                            .padding(.leading, 5)
                            .alert("Sorting is optional :)", isPresented: $showAlert) {Button("OK"){}}
                    }
                }.padding(.leading, 15)
            }
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("Search menu", text: $searchText)
            }.padding(5)
            FetchedObjects(predicate: buildPredicate(), sortDescriptors: buildSortDescriptors()) { (dishes : [Dish]) in
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
    
    func buildPredicate() -> NSPredicate {
        return searchText.isEmpty ?
        NSPredicate(value: true) :
        NSPredicate(format: "title CONTAINS[cd] %@", searchText)
    }
}

#Preview {
    MenuPage().environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
}
