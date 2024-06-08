//
//  IconTitleSubtitleView.swift
//  Gmail-SwiftUI-Combine
//
//  Created by Singh, Ankit on 2024-05-28
//
        
import SwiftUI

struct IconTitleSubtitleView: View {
    let icon: String?
    let name: String
    let email: String
    
    var body: some View {
        HStack(alignment: .center) {
            Image(.user)
                .resizable()
                .frame(width: Constants.Frame.size35,
                       height: Constants.Frame.size35)
                .padding(.horizontal, Constants.Padding.padding10)

            VStack {
                Text(name)
                    .setFont(.title3, color: .white)
                
                Text(email)
                    .setFont(.caption, color: .gray)
            }
        }
        Text("")
    }
}
