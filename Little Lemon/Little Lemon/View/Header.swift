//
//  Header.swift
//  Little Lemon
//
//  Created by Guy Steinberg on 12/04/2024.
//

import SwiftUI

struct Header: View {
    var body: some View {
        NavigationStack {
            VStack {
                ZStack(alignment: .center) {
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                    HStack {
                        Spacer()
                        NavigationLink(destination: UserProfilePage()) {
                            Image("profile")
                                .resizable()
                                .aspectRatio( contentMode: .fit)
                                .frame(maxHeight: 50)
                                .clipShape(Circle())
                                .padding(.trailing)
                        }
                    }
                }
            }
        }
        .frame(maxHeight: 50)
    }
}

#Preview {
    Header()
}
