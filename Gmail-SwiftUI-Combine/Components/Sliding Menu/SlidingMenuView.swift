//
//  SlidingMenuView.swift
//  Gmail-SwiftUI-Combine
//
//  Created by Singh, Ankit on 2024-07-04
//
        

import SwiftUI

struct SlidingMenuView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        HStack {
            ZStack {
                Theme.composeBtnBGColor(for: colorScheme)
                VStack {
                    VStack {
                        HStack {
                            Image(.gmail, false)
                                .resizable()
                                .frame(width: Constants.Frame.size35, height: Constants.Frame.size25)
                                .padding(.leading, Constants.Spacing.spacing15)
                            
                            Text("Gmail")
                                .setFont(.title3, color: .white)
                            
                            Spacer()
                        }
                        Divider()
                    }
                    .padding(.top, Constants.Spacing.spacing20)
                    Spacer()
                }
            }
            .frame(width: Utility.screenSize.width * 0.85)
            Spacer()
        }
    }
}
