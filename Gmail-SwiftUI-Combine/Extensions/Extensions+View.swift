//
//  Extensions+View.swift
//  Gmail-SwiftUI-Combine
//
//  Created by Singh, Ankit on 2024-04-26
//
        
import Foundation
import SwiftUI

extension View {
    func addRippleEffect(with color: Color = .accentColor.opacity(0.5)) -> some View {
        modifier(RippleEffectViewModifier(with: color))
    }
}
