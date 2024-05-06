//
//  GCCTabbarVM.swift
//  Gmail-SwiftUI-Combine
//
//  Created by Singh, Ankit on 2024-04-17
//
        
import Foundation
import SwiftUI

extension GCCTabar {
    class ViewModel: ObservableObject {
        let buttonWidth: CGFloat = Constants.Frame.size20
        let buttonHeight: CGFloat = Constants.Frame.size15
        
        func getTabTintColor(for selectedIndex: Int,
                             tabIndex: Int,
                             colorScheme: ColorScheme) -> Color {
            selectedIndex == tabIndex ? Theme.tintColor(for: colorScheme) : .white
        }
        
        func getRippleTintColor(for colorScheme: ColorScheme) -> Color {
            Theme.tintColor(for: colorScheme).opacity(Constants.rippleTintColorOpacity)
        }
    }
}
