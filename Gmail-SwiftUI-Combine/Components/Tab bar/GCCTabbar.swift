//
//  GCCTabbar.swift
//  Gmail-SwiftUI-Combine
//
//  Created by Singh, Ankit on 2024-04-17
//
        
import Foundation
import SwiftUI

struct GCCTabar: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var viewModel = ViewModel()
    @State var selectedIndex: Int = 0
    
    var body: some View {
        ZStack {
            Theme.tabBarBGColor(for: colorScheme)
            
            HStack {
                Spacer()
                Button(action: {
                    selectedIndex = 0
                }) {
                    Image(.email)
                        .resizable()
                        .frame(width: viewModel.buttonWidth,
                               height: viewModel.buttonHeight)
                        .foregroundColor(viewModel.getTabTintColor(for: selectedIndex,
                                                                   tabIndex: 0,
                                                                   colorScheme: colorScheme))
                        .addRippleEffect(with: viewModel.getRippleTintColor(for: colorScheme))
                }
                Spacer()
                Spacer()
                Button(action: {
                    selectedIndex = 1
                }) {
                    Image(.meet)
                        .resizable()
                        .frame(width: viewModel.buttonWidth,
                               height: viewModel.buttonHeight)
                        .foregroundColor(viewModel.getTabTintColor(for: selectedIndex,
                                                                   tabIndex: 1,
                                                                   colorScheme: colorScheme))
                        .addRippleEffect(with: viewModel.getRippleTintColor(for: colorScheme))
                }
                Spacer()
            }
        }
    }
}

