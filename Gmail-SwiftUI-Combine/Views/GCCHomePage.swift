//
//  GCCHomePage.swift
//  Gmail-SwiftUI-Combine
//
//  Created by Singh, Ankit on 2024-04-13
//
        
import Foundation
import SwiftUI

struct GCCHomePage: View {    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            Color.clear
        }
        .background(Theme.primaryColor(for: colorScheme))
    }
}
