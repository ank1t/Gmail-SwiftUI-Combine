//
//  GCCHomePage.swift
//  Gmail-SwiftUI-Combine
//
//  Created by Singh, Ankit on 2024-04-13
//
        
import Foundation
import SwiftUI

struct GCCHomePage: View {    
    @State private var immersiveReading: Bool = false
    @State private var shouldShowEmailView: Bool = true
    @State private var searchBarFrame: CGRect = .zero
    @State private var slidingMenuIsShowing: Bool = false
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            shouldShowEmailView ? AnyView(emailView) : AnyView(gMeetView)
            GCCTabar(shouldShowEmailView: $shouldShowEmailView)
                .frame(height: immersiveReading ? Constants.Frame.size00 : Constants.Frame.size50)
                .animation(.easeIn(duration: Constants.tabBarAnimationDuration),
                           value: immersiveReading)
            SlidingMenu(isShowing: $slidingMenuIsShowing,content: AnyView(Color.blue.onTapGesture(perform: {
                slidingMenuIsShowing.toggle()
            })))
        }
        .background(Theme.primaryColor(for: colorScheme))
    }
    
    var emailView: some View {
        GCCEmailView(immersiveReading: $immersiveReading,
                     slidingMenuIsShowing: $slidingMenuIsShowing,
                     searchBarFrame: $searchBarFrame)
    }
    
    var gMeetView: some View {
        GCCGMeetView()
    }
}
