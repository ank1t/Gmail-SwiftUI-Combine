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
                            
                            HStack {
                                Image(systemName: ImageName.add.rawValue)
                                    .resizable()
                                    .frame(width: Constants.Frame.size15,
                                           height: Constants.Frame.size15)
                                
                                Text("Create new")
                                    .padding(.leading, Constants.Spacing.spacing20)
                                
                                Spacer()
                            }
                            .padding(.leading, Constants.Padding.padding20)
                            .padding(.vertical, Constants.Padding.padding10)
                            
                            Divider()
                                .padding(.leading, Constants.Padding.padding25)
                        }
                        
                    }
                }
            }
            .frame(width: Utility.screenSize.width * 0.85)
            Spacer()
        }
    }
    
    private func addRequiredRows() -> VStack {
        VStack {
            
            
        }
    }
}
