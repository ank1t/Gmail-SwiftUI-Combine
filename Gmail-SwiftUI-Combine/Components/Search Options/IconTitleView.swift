//
//  IconTitleView.swift
//  Gmail-SwiftUI-Combine
//
//  Created by Singh, Ankit on 2024-05-28
//
        

import SwiftUI

struct IconTitleView: View {
    var icon: String?
    var utilityIcon: Utility.ImageName?
    let title: String
    
    var body: some View {
        HStack {
            getImage()
                .resizable()
                .frame(width: Constants.Frame.size20,
                       height: Constants.Frame.size20)
                .padding(.horizontal, Constants.Padding.padding25)
            
            Text(title)
                .setFont(.callout, color: .white)
            
            Spacer()
        }
        .padding(.vertical, Constants.Padding.padding10)
    }
    
    private func getImage() -> Image {
        if let icon {
            return Image(systemName: icon)
        } else if let utilityIcon {
            return Image(utilityIcon)
        }
        return Image(systemName: "questionmark.circle")
    }
}
