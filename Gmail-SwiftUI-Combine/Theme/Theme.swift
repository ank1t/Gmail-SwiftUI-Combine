//
//  Theme.swift
//  Gmail-SwiftUI-Combine
//
//  Created by Singh, Ankit on 2024-04-15
//
        
import Foundation
import SwiftUI

struct Theme {
    static func screenBackground(for theme: ColorScheme) -> Color {
        theme == .dark ? Constants.darkThemeColorPrimary : Color.clear
    }
    
    static func textFieldBackground(for theme: ColorScheme) -> Color {
        theme == .dark ? Constants.darkThemeColorSecondary : Color.clear
    }
    
    static func tintColor(for theme: ColorScheme) -> Color {
        //Maintain the same tint for dark and light scenarios
        return Constants.composeBtnTintColor
    }
    
    static func composeBtnBGColor(for theme: ColorScheme) -> Color {
        theme == .dark ? Constants.darkThemeComposeBtnBG : Constants.lightThemeComposeBtnBG
    }
    
    static func tabBarBGColor(for theme: ColorScheme) -> Color {
        theme == .dark ? Constants.darkThemeTabbarBG : Constants.lightThemeTabbarBG
    }
}
