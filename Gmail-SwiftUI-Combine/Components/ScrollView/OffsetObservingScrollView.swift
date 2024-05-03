//
//  OffsetObservingScrollView.swift
//  Gmail-SwiftUI-Combine
//
//  Created by Singh, Ankit on 2024-04-29
//
        
import Foundation
import SwiftUI

struct OffsetObservingScrollView<Content: View>: View {
    @Binding var offset: CGPoint
    @ViewBuilder var content: () -> Content
    
    private let coordinateSpaceName = UUID()
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            PositionObservingView(
                coordinateSpace: .named(coordinateSpaceName),
                position: Binding(
                    get: { offset },
                    set: { newOffset in
                        offset = CGPoint(
                            x: -newOffset.x,
                            y: -newOffset.y
                        )
                    }
                ),
                content: content
            )
        }
        .coordinateSpace(name: coordinateSpaceName)
    }
}
