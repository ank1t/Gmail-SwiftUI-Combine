//
//  Extensions+View.swift
//  Gmail-SwiftUI-Combine
//
//  Created by Singh, Ankit on 2024-04-15
//
        
import Foundation
import SwiftUI

extension Text {
    func setFont(_ font: Font, color: Color,
                 weight: Font.Weight = .regular) -> Text {
        self
        .font(font)
        .foregroundColor(color)
        .fontWeight(weight)
    }
}
