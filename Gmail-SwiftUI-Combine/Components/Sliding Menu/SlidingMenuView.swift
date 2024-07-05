//
//  SlidingMenuView.swift
//  Gmail-SwiftUI-Combine
//
//  Created by Singh, Ankit on 2024-07-04
//
        

import SwiftUI

struct SlidingMenuView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        HStack {
            Theme.composeBtnBGColor(for: colorScheme)
                .frame(width: Utility.screenSize.width * 0.85)
            Spacer()
        }
    }
}
