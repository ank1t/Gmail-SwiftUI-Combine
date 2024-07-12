//
//  SlidingMenuRowView.swift
//  Gmail-SwiftUI-Combine
//
//  Created by Singh, Ankit on 2024-07-04
//
        

import SwiftUI

struct SlidingMenuRowView: View {
    let icon: String
    let title: String
    let count: Int?
    
    var isSelected: Bool = false
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .resizable()
                .frame(width: Constants.Frame.size15,
                       height: Constants.Frame.size15)
            
            
            Text(title)
                .padding(.leading, Constants.Spacing.spacing20)
            
            Spacer()
            
            if let count {
                Text("\(count)")
                    .font(.footnote)
                    .padding(.trailing, Constants.Padding.padding15)
            }
        }
    }
}
