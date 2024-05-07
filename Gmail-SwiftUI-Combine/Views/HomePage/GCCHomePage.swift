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
    @State private var searchText: String = ""
    @State private var scrollOffset: CGPoint = .zero
    @State private var previousYOffset: CGFloat = 0
    @State private var immersiveReading: Bool = false
    @State private var viewModel = ViewModel()
    @State private var shouldShowEmailView: Bool = true
    
    var body: some View {
        shouldShowEmailView ? EmailView() : 
    }
}
