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
            Color(uiColor: .systemYellow)
            HStack {
                VStack(alignment: .leading) {
                    Text("Little Lemon")
                        .font(.largeTitle)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .fontWidth(.expanded)
                        .foregroundStyle(.black)
                    Text("Vancouver")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                    
                    Text("Description,Description. Description. Description. Description.")
                }
                Image("lemon-dish")
                    .resizable()
                    .frame(width: 170, height: 200)
                    .aspectRatio(contentMode: .fill)
            }
            .padding(.top, 50)
            .padding(.trailing, 10)
        }
        .frame(width: .infinity, height: 300)
    }
}

#Preview {
    RestaurantInfo()
}
