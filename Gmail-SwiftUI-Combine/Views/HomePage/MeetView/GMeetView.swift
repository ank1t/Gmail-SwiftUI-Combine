//
//  GMeetView.swift
//  Gmail-SwiftUI-Combine
//
//  Created by Singh, Ankit on 2024-05-06
//

import Foundation
import SwiftUI

struct GCCGMeetView: View {
    var body: some View {
        VStack {
            HStack {
                Image(.moreMenu)
                    .resizable()
                    .frame(width: Constants.Frame.size25,
                           height: Constants.Frame.size25)
                    .padding(.leading, Constants.Padding.padding20)
                
                Spacer()
                Text("Meet")
                    .setFont(.title3,
                             color: .gray)
                
                Spacer()
                Text("A")
                    .setFont(.title3, color: .white)
                    .padding(Constants.Padding.padding8)
                    .background(.red)
                    .clipShape(Circle())
                    .padding(.trailing, Constants.Padding.padding20)
            }
            Spacer()
        }
//        TabView {
//            Color.orange
//            Color.blue
//            Color.yellow
//        }
//        .tabViewStyle(.page(indexDisplayMode: .always))
//        .indexViewStyle(.page(backgroundDisplayMode: .always))
//        .padding(.bottom, 50)
    }
}
