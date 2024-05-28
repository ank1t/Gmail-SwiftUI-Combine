//
//  AttachmentLabelOptionsView.swift
//  Gmail-SwiftUI-Combine
//
//  Created by Singh, Ankit on 2024-05-28
//
        
import SwiftUI

struct AttachmentLabelOptionsView: View {
    let title: String
    
    var body: some View {
        VStack {
            HStack(spacing: Constants.Spacing.spacing5) {
                Image(.close)
                    .resizable()
                    .frame(width: Constants.Frame.size12,
                           height: Constants.Frame.size12)
                    .padding(.horizontal, Constants.Padding.padding20)
                
                Text(title)
                    .setFont(.subheadline, color: .white)
                
                Spacer()
            }
            .padding(.vertical, Constants.Padding.padding20)
            
            Spacer()
        }
    }
}
