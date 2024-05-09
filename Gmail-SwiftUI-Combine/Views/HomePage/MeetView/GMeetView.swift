//
//  GMeetView.swift
//  Gmail-SwiftUI-Combine
//
//  Created by Singh, Ankit on 2024-05-06
//

import Foundation
import SwiftUI

struct GCCGMeetView: View {
    var body: some View {
        TabView {
            Color.orange
            Color.blue
            Color.yellow
        }
        .tabViewStyle(.page(indexDisplayMode: .always))
        .indexViewStyle(.page(backgroundDisplayMode: .always))
        .padding(.bottom, 50)
    }
}
