//
//  FromToSearchOptionsView.swift
//  Gmail-SwiftUI-Combine
//
//  Created by Singh, Ankit on 2024-06-05
//
        

import SwiftUI

struct FromToSearchOptionsView: View {
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
            
//            ScrollView {
//                VStack {
////                    ForEach(options) { option in
////                        IconTitleView(icon: option.icon,
////                                      title: option.title)
////                    }
//                }
//            }
        }
    }
}

extension FromToSearchOptionsView {
    enum ViewType {
        case attachments
        case label
        
        var title: String {
            switch self {
                case .attachments:
                    return "Attachment"
                case .label:
                    return "Label"
            }
        }
        
        var textfieldPlaceholder: String? {
            switch self {
                case .label:
                    return "Search labels"
                default:
                    return nil
            }
        }
    }
}
