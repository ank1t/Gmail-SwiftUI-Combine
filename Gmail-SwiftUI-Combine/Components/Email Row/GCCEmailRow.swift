//
//  GCCEmailRow.swift
//  Gmail-SwiftUI-Combine
//
//  Created by Singh, Ankit on 2024-04-13
//
        
import Foundation
import SwiftUI

struct GCCEmailRow: View {
    var shouldBoldTitleAndSubtitle: Bool = false
    @State private var viewModel = ViewModel()
    
    var textColor: Color {
        shouldBoldTitleAndSubtitle ? .white : .gray
    }
    
    var titleTextFontWeight: Font.Weight {
        shouldBoldTitleAndSubtitle ? .bold : .medium
    }
    
    var textFontWeight: Font.Weight {
        shouldBoldTitleAndSubtitle ? .bold : .regular
    }
    
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
                        .setFont(.callout, color: textColor, weight: titleTextFontWeight)
                    Spacer()
                    Text(viewModel.date)
                        .setFont(.caption2, color: textColor, weight: textFontWeight)
                }
                Text(viewModel.subject)
                    .setFont(.callout, color: textColor, weight: textFontWeight)
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
