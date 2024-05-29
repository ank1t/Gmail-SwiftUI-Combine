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
    
    var body: some View {
        VStack {
            HStack(spacing: Constants.Spacing.spacing5) {
                Image(.close)
                    .resizable()
                    .frame(width: Constants.Frame.size12,
                           height: Constants.Frame.size12)
                    .padding(.horizontal, Constants.Padding.padding20)
                
                Text(type.title)
                    .setFont(.subheadline, color: .white)
                
                Spacer()
            }
            .padding(.vertical, Constants.Padding.padding20)
            
            if let placeholder = type.textfieldPlaceholder {
                Divider()
                TextField(placeholder, text: $textFieldText)
            }
            Divider()
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
