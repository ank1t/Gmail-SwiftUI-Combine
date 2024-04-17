//
//  GCCEmailRow.swift
//  Gmail-SwiftUI-Combine
//
//  Created by Singh, Ankit on 2024-04-13
//
        
import Foundation
import SwiftUI

struct GCCEmailRow: View {
    let viewModel: GCCEmailRowVM
    
    var body: some View {
        HStack(alignment: .top, spacing: Constants.Spacing.spacing10) {
            Image(.user)
                .resizable()
                .frame(width: Constants.Frame.size25,
                       height: Constants.Frame.size25)
            
            
        }
    }
}
