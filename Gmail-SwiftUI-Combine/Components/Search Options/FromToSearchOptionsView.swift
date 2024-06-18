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
    let bgOpacity: CGFloat = 0.2
    
    @Binding var shouldHideDropdownSheet: Bool
    @State private var textFieldText: String = ""
    @State private var isModalShown = false
    
    var body: some View {
        ZStack {
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
                
                HStack {
                    Text("Suggestions")
                        .setFont(.caption, color: .gray)
                        .padding(.leading, Constants.Padding.padding10)
                    
                    Image(.info)
                        .resizable()
                        .frame(width: Constants.Frame.size12, height: Constants.Frame.size12)
                        .onTapGesture {
                            isModalShown.toggle()
                        }
                    
                    Spacer()
                }
                .padding(.top, Constants.Padding.padding10)
                .padding(.bottom, Constants.Padding.padding4)
                
                ScrollView {
                    LazyVStack {
                        ForEach(options) { option in
                            if !textFieldText.isEmpty {
                                if (option.name.contains(textFieldText) || option.email.contains(textFieldText)) {
                                    IconTitleSubtitleView(icon: option.icon,
                                                          name: option.name,
                                                          email: option.email)
                                }
                            } else {
                                IconTitleSubtitleView(icon: option.icon,
                                                      name: option.name,
                                                      email: option.email)
                            }
                        }
                    }
                }
                Spacer()
            }
            
            if isModalShown {
                ZStack {
                    Color.black
                        .opacity(bgOpacity)
                    ModalView(title: "About suggested people",
                              subtitle: "To make sharing easier, Google suggests people to share with based on your interactions",
                              ctaText: "OK",
                              isModalShown: $isModalShown)
                }
            }
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
