//
//  PositionObservingView.swift
//  Gmail-SwiftUI-Combine
//
//  Created by Singh, Ankit on 2024-04-28
//
        
import Foundation
import SwiftUI

struct PositionObservingView<Content: View>: View {
    var coordinateSpace: CoordinateSpace
    @Binding var position: CGFloat
    @ViewBuilder var content: Content
    
    
}
