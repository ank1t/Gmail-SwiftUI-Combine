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
    @State private var immersiveReading: Bool = false
    @State private var hideSearchbarWithoutAnimation: Bool = false
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            shouldShowEmailView ? AnyView(emailView) : AnyView(gMeetView)
            GCCTabar(shouldShowEmailView: $shouldShowEmailView)
                .frame(height: immersiveReading || hideSearchbarWithoutAnimation
                       ? Constants.Frame.size00 : Constants.Frame.size50)
                .animation(!hideSearchbarWithoutAnimation
                           ? nil : .easeIn(duration: Constants.tabBarAnimationDuration),
                           value: immersiveReading)
        }
        .background(Theme.primaryColor(for: colorScheme))
    }
    
    var emailView: some View {
        GCCEmailView(immersiveReading: $immersiveReading,
                     hideSearchbarWithoutAnimation: $hideSearchbarWithoutAnimation,
                     shouldShowEmailView: $shouldShowEmailView)
    }
    
    var gMeetView: some View {
        GCCGMeetView()
    }
}
