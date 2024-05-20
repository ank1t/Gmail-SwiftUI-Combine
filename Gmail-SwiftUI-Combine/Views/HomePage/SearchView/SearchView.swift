//
//  SearchView.swift
//  Gmail-SwiftUI-Combine
//
//  Created by Singh, Ankit on 2024-05-12
//
        
import Foundation
import SwiftUI

struct SearchView: View {
    @Environment(\.colorScheme) var colorScheme
    @Binding var shouldShowSearchView: Bool
    @State private var rotationAngle: Double = 180
    
    var body: some View {
        ZStack {
            Theme.primaryColor(for: colorScheme)
            VStack {
                HStack {
                    Image(.backChevron)
                        .resizable()
                        .frame(width: Constants.Frame.size10,
                               height: Constants.Frame.size15)
                        .padding(.leading, Constants.Padding.padding15)
                        .rotationEffect(Angle(degrees: rotationAngle))
                        .animation(.linear(duration: 0.1), value: rotationAngle)
                        .onTapGesture {
                            rotationAngle += 180
                        }
                    Spacer()
                    Image(.mic)
                        .resizable()
                        .frame(width: Constants.Frame.size14,
                               height: Constants.Frame.size20)
                        .padding(.trailing, Constants.Padding.padding15)
                }
                
                Spacer()
            }
        }
    }
}
