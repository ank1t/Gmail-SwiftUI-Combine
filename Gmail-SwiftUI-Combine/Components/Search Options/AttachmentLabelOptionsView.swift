//
//  AttachmentLabelOptionsView.swift
//  Gmail-SwiftUI-Combine
//
//  Created by Singh, Ankit on 2024-05-28
//
        
import SwiftUI

struct AttachmentLabelOptionsView: View {
    let type: ViewType
    @Binding var textFieldText: String
    @Binding var shouldHideDropdownSheet: Bool
    let options: [AttachmentLabelOptions]
    
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
            
            if let placeholder = type.textfieldPlaceholder {
                Divider()
                TextField(placeholder, text: $textFieldText)
                    .padding(.leading, Constants.Padding.padding25)
            }
            Divider()
            
            ScrollView {
                VStack {
                    ForEach(options) { option in
                        if !textFieldText.isEmpty {
                            if option.title.contains(textFieldText) {
                                IconTitleView(icon: option.icon,
                                              title: option.title)
                            }
                        } else {
                            IconTitleView(icon: option.icon,
                                          title: option.title)
                        }
                    }
                }
            }
        }
    }
}

extension AttachmentLabelOptionsView {
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
