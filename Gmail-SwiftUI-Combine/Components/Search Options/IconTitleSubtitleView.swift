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
        HStack {
            Image(.user)
                .resizable()
                .frame(width: Constants.Frame.size30,
                       height: Constants.Frame.size30)
                .padding(.horizontal, Constants.Padding.padding10)

            VStack(alignment: .leading) {
                Text(name)
                    .setFont(.system(size: Constants.Font.font16), color: .white)
                
                Text(email)
                    .setFont(.system(size: Constants.Font.font14), color: .gray)
            }
            
            Spacer()
        }
        .padding(.vertical, Constants.Padding.padding10)
    }
}
