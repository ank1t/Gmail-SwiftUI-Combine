//
//  SearchView.swift
//  Gmail-SwiftUI-Combine
//
//  Created by Singh, Ankit on 2024-05-12
//
        
import Foundation
import SwiftUI

struct SearchView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack {
            Theme.primaryColor(for: colorScheme)
        }
    }
}
