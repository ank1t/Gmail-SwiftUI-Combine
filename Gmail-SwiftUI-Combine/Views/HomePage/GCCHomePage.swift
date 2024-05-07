//
//  GCCHomePage.swift
//  Gmail-SwiftUI-Combine
//
//  Created by Singh, Ankit on 2024-04-13
//
        
import Foundation
import SwiftUI

struct GCCHomePage: View {    
    @State private var shouldShowEmailView: Bool = true
    
    var body: some View {
        shouldShowEmailView ? AnyView(GCCEmailView(shouldShowEmailView: $shouldShowEmailView)) : AnyView(GCCGMeetView())
    }
}
