//
//  Theme.swift
//  Gmail-SwiftUI-Combine
//
//  Created by Singh, Ankit on 2024-04-15
//
        
import Foundation
import SwiftUI

struct Theme {
    static func primaryColor(for theme: ColorScheme) -> Color {
        theme == .dark ? Constants.darkThemeColorPrimary : Color.clear
    }
}
