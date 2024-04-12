//
//  MenuPage.swift
//  Little Lemon
//
//  Created by Guy Steinberg on 12/04/2024.
//

import SwiftUI

struct MenuPage: View {
    var body: some View {
        VStack {
            Text("Title")
            Text("Vancouver")
            Text("Description")
            List(content: {})
        }
    }
}

#Preview {
    MenuPage()
}
