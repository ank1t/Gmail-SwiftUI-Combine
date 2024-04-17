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
        HStack(alignment: .top, spacing: Constants.Spacing.spacing15) {
            Image(.user)
                .resizable()
                .foregroundColor(Constants.getSenderImageBGColor())
                .frame(width: Constants.Frame.size35,
                       height: Constants.Frame.size35)
            
            VStack(alignment: .leading, spacing: Constants.Spacing.spacing2) {
                HStack(alignment: .center) {
                    Text(viewModel.senderList.first!)
                        .setFont(.callout, color: .gray, weight: .medium)
                    Spacer()
                    Text(viewModel.date)
                        .setFont(.caption2, color: .gray)
                }
                Text(viewModel.subject)
                    .setFont(.callout, color: .gray)
                    .lineLimit(1)
                    .truncationMode(.tail)
                
                HStack(alignment: .top, spacing: Constants.Spacing.spacing15) {
                    Text(viewModel.message)
                        .setFont(.callout, color: .gray)
                        .lineLimit(1)
                        .truncationMode(.tail)
                    
                    Image(.star)
                        .resizable()
                        .frame(width: Constants.Frame.size15,
                               height: Constants.Frame.size15)
                }
                Spacer()
            }
        }
    }
}
