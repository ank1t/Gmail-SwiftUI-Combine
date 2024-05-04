//
//  GCCHomePageVM.swift
//  Gmail-SwiftUI-Combine
//
//  Created by Singh, Ankit on 2024-05-02
//
        
import Foundation
import SwiftUI

extension GCCHomePage {
    class ViewModel: ObservableObject {
        let animationDuration: CGFloat = 0.1
        
        func getLeadingPaddingForComposeBtn(_ hideTabBar: Bool) -> CGFloat {
            hideTabBar ? Constants.Padding.padding15 : Constants.Padding.padding10
        }
        
        func getTrailingPaddingForComposeBtn(_ hideTabBar: Bool) -> CGFloat {
            hideTabBar ? Constants.Padding.padding15 : Constants.Padding.padding25
        }
        
        func getClipShapeForComposeBtn(_ hideTabBar: Bool) -> AnyShape {
            hideTabBar ? AnyShape(Circle()) : AnyShape(Capsule())
        }
    }
}
