//
//  Constants.swift
//  Gmail-SwiftUI-Combine
//
//  Created by Singh, Ankit on 2024-04-15
//
        
import Foundation
import SwiftUI

struct Constants {
    static let darkThemeColorPrimary = Color(red: 10/255.0, green: 10/255.0, blue: 10/255.0)
    static let darkThemeColorSecondary = Color(red: 41/255.0, green: 41/255.0, blue: 41/255.0)
    static let darkThemeColorTertiary = Color(red: 51/255.0, green: 51/255.0, blue: 51/255.0)
    static let darkThemeColorQuaternary = Color(red: 61/255.0, green: 61/255.0, blue: 61/255.0)
    static let darkThemeComposeBtnBG = Color(red: 30/255.0, green: 30/255.0, blue: 30/255.0)
    static let darkThemeTabbarBG = Color(red: 20/255.0, green: 20/255.0, blue: 20/255.0)
    static let darkThemeNavbarBGColor = Color(red: 35/255.0, green: 35/255.0, blue: 35/255.0)
    
    static let lightThemeColorPrimary = Color(red: 34/255.0, green: 40/255.0, blue: 49/255.0)
    static let lightThemeColorSecondary = Color(red: 49/255.0, green: 54/255.0, blue: 63/255.0)
    static let lightThemeColorTertiary = Color(red: 118/255.0, green: 171/255.0, blue: 174/255.0)
    static let lightThemeColorQuaternary = Color(red: 238/255.0, green: 238/255.0, blue: 238/255.0)
    static let lightThemeComposeBtnBG = Color(red: 255/255.0, green: 255/255.0, blue: 255/255.0)
    static let lightThemeTabbarBG = Color(red: 255/255.0, green: 255/255.0, blue: 255/255.0)
    
    static let composeBtnTintColor = Color(red: 255/255.0, green: 87/255.0, blue: 51/255.0)
    
    private static let senderIconBGColor: [Color] = [.purple, .green, .orange, .yellow, .red, .pink]
    static func getSenderImageBGColor() -> Color {
        return .blue
    }
    static let rippleTintColorOpacity: Double = 0.3
    static let tabBarAnimationDuration: CGFloat = 0.1
    
    struct Spacing {
        static let spacing2: CGFloat = 2
        static let spacing5: CGFloat = 5
        static let spacing10: CGFloat = 10
        static let spacing15: CGFloat = 15
        static let spacing20: CGFloat = 20
        static let spacing40: CGFloat = 40
        static let spacing70: CGFloat = 70
    }
    
    struct Padding {
        static let padding5: CGFloat = 5
        static let padding8: CGFloat = 8
        static let padding10: CGFloat = 10
        static let padding15: CGFloat = 15
        static let padding20: CGFloat = 20
        static let padding25: CGFloat = 25
        static let padding30: CGFloat = 30
        static let padding35: CGFloat = 35
        static let padding50: CGFloat = 50
    }
    
    struct Corner {
        static let radius5: CGFloat = 5
        static let radius10: CGFloat = 10
    }
    
    struct Frame {
        static let size00: CGFloat = 0
        static let size10: CGFloat = 10
        static let size14: CGFloat = 14
        static let size15: CGFloat = 15
        static let size20: CGFloat = 20
        static let size25: CGFloat = 25
        static let size35: CGFloat = 35
        static let size40: CGFloat = 40
        static let size50: CGFloat = 50
        static let size200: CGFloat = 200
    }
}
