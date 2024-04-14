//
//  RestaurantInfo.swift
//  Little Lemon
//
//  Created by Guy Steinberg on 12/04/2024.
//

import SwiftUI

struct RestaurantInfo: View {
    
    var body: some View {
        ZStack(alignment: .top) {
            Color(.primaryColorGreen)
            HStack {
                VStack(alignment: .leading) {
                    Text("Little Lemon")
                        .font(.largeTitle)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .fontWidth(.expanded)
                        .foregroundStyle(.primaryColorYellow)
                    Text("Vancouver")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                    
                    Text("We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist")
                        .foregroundStyle(.white)
                }
                Image("lemon-dish")
                    .resizable()
                    .frame(width: 170, height: 200)
                    .aspectRatio(contentMode: .fill)
                    .cornerRadius(10)
            }
            .padding([.leading, .trailing], 10)
            .padding(.top, 50)
        }
        .frame(maxHeight: 350)
    }
}

#Preview {
    RestaurantInfo()
}
