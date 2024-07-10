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
                    ScrollView {
                        VStack {
                            if let options = searchFilters?.filters.first?.attachmentLabelOptions {
                                ForEach(options, id: \.id) { option in
                                    HStack {
                                        Spacer()
                                        SlidingMenuRowView()
                                        Text(option.title)
                                        Spacer()
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .frame(width: Utility.screenSize.width * 0.85)
            Spacer()
        }
    }
}
