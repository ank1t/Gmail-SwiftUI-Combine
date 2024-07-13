//
//  SlidingMenuView.swift
//  Gmail-SwiftUI-Combine
//
//  Created by Singh, Ankit on 2024-07-04
//
        

import SwiftUI

struct SlidingMenuView: View {
    @Environment(\.colorScheme) var colorScheme
    let searchFilters: SearchFilters?
    
    var body: some View {
        HStack {
            ZStack {
                Theme.composeBtnBGColor(for: colorScheme)
                VStack {
                    VStack {
                        HStack {
                            Image(.gmail, false)
                                .resizable()
                                .frame(width: Constants.Frame.size25, height: Constants.Frame.size20)
                                .padding(.leading, Constants.Spacing.spacing30)
                            
                            Text("Gmail")
                                .setFont(.title3, color: .white)
                            
                            Spacer()
                        }
                        Divider()
                    }
                    .padding(.top, Constants.Spacing.spacing40)
                    ScrollView(showsIndicators: false) {
                        VStack {
                            addRequiredRows(ImageName.inbox.rawValue, "Inbox", true)
                            
                            if let options = searchFilters?.filters.first?.attachmentLabelOptions {
                                ForEach(options, id: \.id) { option in
                                    VStack {
                                        if option.isCustom {
                                            Divider()
                                                .padding(.leading, Constants.Padding.padding25)
                                            
                                            HStack {
                                                Text("Labels".uppercased())
                                                    .font(.footnote)
                                                    .padding(.horizontal, Constants.Padding.padding25)
                                                    .padding(.vertical, Constants.Padding.padding10)
                                                
                                                Spacer()
                                            }
                                        }
                                        HStack {
                                            
                                            SlidingMenuRowView(icon: option.icon,
                                                               title: option.title,
                                                               count: option.count)
                                            .padding(.leading, Constants.Padding.padding20)
                                            .padding(.vertical, Constants.Padding.padding10)
                                            
                                            Spacer()
                                        }
                                    }
                                }
                            }
                            Divider()
                                .padding(.leading, Constants.Padding.padding25)
                            
                            addRequiredRows(ImageName.add.rawValue, "Create new", true)
                            addRequiredRows(ImageName.settings.rawValue, "Settings")
                            addRequiredRows(ImageName.sendFeedback.rawValue, "Send feedback")
                            addRequiredRows(ImageName.help.rawValue, "Help")
                        }
                        
                    }
                }
            }
            .frame(width: Utility.screenSize.width * 0.85)
            Spacer()
        }
    }
    
    @ViewBuilder
    private func addRequiredRows(_ icon: String,
                                 _ title: String,
                                 _ showDivider: Bool = false) -> some View {
        VStack {
            HStack {
                Image(systemName: icon)
                    .resizable()
                    .frame(width: Constants.Frame.size15,
                           height: Constants.Frame.size15)
                
                Text(title)
                    .padding(.leading, Constants.Spacing.spacing20)
                
                Spacer()
            }
            .padding(.leading, Constants.Padding.padding20)
            .padding(.vertical, Constants.Padding.padding10)
            
            if showDivider {
                Divider()
                    .padding(.leading, Constants.Padding.padding20)
            }
            
            Spacer()
                .frame(height: Constants.Frame.size10)
        }
    }
}
