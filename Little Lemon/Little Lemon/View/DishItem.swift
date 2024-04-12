//
//  DishItem.swift
//  Little Lemon
//
//  Created by Guy Steinberg on 12/04/2024.
//

import SwiftUI

struct DishItem: View {
    let dish: Dish
    var price: String {
        formatPrice(price: dish.price)
    }
    
    var body: some View {
        HStack {
            VStack {
                HStack {
                    Text("\(dish.title!)")
                    Spacer()
                    Text("\(price)")
                }
                Text(dish.info ?? "")
                    .font(.caption2)
            }
            AsyncImage(url: URL(string: dish.image ?? "")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                ProgressView()
            }
            .frame(maxWidth: 90, maxHeight: 90)
            .clipShape(Rectangle())
        }
        .padding(.vertical)
        .frame(maxHeight: 150)
    }
    
    func formatPrice(price: Float) -> String {
          let spacing = price < 10 ? " " : ""
          return "$ " + spacing + String(format: "%.2f", price)
      }
}

#Preview {
    let dishEx = Dish(context: PersistenceController.shared.container.viewContext)
    dishEx.title = "Greek Salad"
    dishEx.price = 10
    dishEx.info = "this is a demo description for a scrumptious greek salad that must include calamata olives, tomatoes, feta cheese and cucumbers"
    dishEx.image = "https://github.com/Meta-Mobile-Developer-PC/Working-With-Data-API/blob/main/images/greekSalad.jpg?raw=true"
    
    return DishItem(dish: dishEx)
}
