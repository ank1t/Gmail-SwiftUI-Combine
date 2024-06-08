//
//  FromToSearchOptionsView.swift
//  Gmail-SwiftUI-Combine
//
//  Created by Singh, Ankit on 2024-06-05
//
        

import SwiftUI

struct FromToSearchOptionsView: View {
    let type: ViewType
    let options: [FromToOptions]
    
    @Binding var shouldHideDropdownSheet: Bool
    @State private var textFieldText: String = ""
    
    var body: some View {
        VStack {
            HStack(spacing: Constants.Spacing.spacing5) {
                Image(.close)
                    .resizable()
                    .frame(width: Constants.Frame.size12,
                           height: Constants.Frame.size12)
                    .padding(.horizontal, Constants.Padding.padding20)
                    .onTapGesture {
                        shouldHideDropdownSheet.toggle()
                    }
                
                Text(type.title)
                    .setFont(.title3, color: .white)
                
                Spacer()
            }
            .padding(.top, Constants.Padding.padding20)
            .padding(.bottom, Constants.Padding.padding10)
            
            TextField("Type a name or email", text: $textFieldText)
                .padding(.leading, Constants.Padding.padding25)
                .padding(.bottom, Constants.Padding.padding10)
            Divider()
        
            ScrollView {
                VStack {
                    ForEach(options) { option in
                        IconTitleSubtitleView()
                    }
                }
            }
            
            Spacer()
        }
    }
}

extension FromToSearchOptionsView {
    enum ViewType: String {
        case from
        case to
        
        var title: String {
            return self.rawValue.capitalized
        }
    }
}
