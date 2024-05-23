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
                .padding(.leading, Constants.Padding.padding5)
                .padding(.trailing, Constants.Padding.padding5)
            
            if shouldShowDropdownArrow {
                Image(.dropdownArrow)
                    .resizable()
                    .frame(width: Constants.Frame.size8,
                           height: Constants.Frame.size5)
                    .padding(.trailing, Constants.Padding.padding5)
            }
        }
        .padding([.vertical, .horizontal], Constants.Padding.padding5)
        .overlay(
            Capsule()
                .stroke(.gray, lineWidth: 1))
        
    }
}
