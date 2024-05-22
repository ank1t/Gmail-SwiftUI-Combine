//
//  SearchOptionsChip.swift
//  Gmail-SwiftUI-Combine
//
//  Created by Singh, Ankit on 2024-05-20
//
        
import Foundation
import SwiftUI

struct SearchOptionsChip: View {
    let title: String = "title"
    let shouldShowDropdownArrow: Bool = true
    
    var body: some View {
        HStack {
            Text(title.capitalized)
                .setFont(.callout, color: .gray)
                .padding(.horizontal, Constants.Padding.padding15)
            
            if shouldShowDropdownArrow {
                Image(.dropdownArrow)
                    .resizable()
                    .frame(width: Constants.Frame.size10,
                           height: Constants.Frame.size10)
                    .clipShape(Capsule())
                    .border(.gray)
            }
        }
    }
}
