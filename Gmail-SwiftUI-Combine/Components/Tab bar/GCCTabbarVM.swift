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
        func getTintColor(for selectedIndex: Int,
                          tabIndex: Int,
                          colorScheme: ColorScheme) -> Color {
            selectedIndex == tabIndex ? Theme.tintColor(for: colorScheme) : .white
        }
    }
}
