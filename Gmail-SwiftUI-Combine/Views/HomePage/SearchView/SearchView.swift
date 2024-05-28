//
//  SearchView.swift
//  Gmail-SwiftUI-Combine
//
//  Created by Singh, Ankit on 2024-05-12
//
        
import Foundation
import SwiftUI

struct SearchView: View {
    @Environment(\.colorScheme) var colorScheme
    @Binding var shouldShowSearchView: Bool
    @State private var rotationAngle: Double = 0
    @State private var leadingPadding: Double = Constants.Padding.padding35
    @State private var textFieldText: String = ""
    @State private var searchFilters: SearchFilters?
    
    var body: some View {
        ZStack {
            Theme.primaryColor(for: colorScheme)
            VStack {
                HStack {
                    Image(.backChevron)
                        .resizable()
                        .frame(width: Constants.Frame.size10,
                               height: Constants.Frame.size15)
                        .padding(.leading, leadingPadding)
                        .rotationEffect(Angle(degrees: rotationAngle))
                        .onAppear {
                            leadingPadding = Constants.Padding.padding15
                        }
                        .onTapGesture {
                            shouldShowSearchView = false
                        }
                        .animation(.spring(), value: leadingPadding)
                    
                    TextField("Search in mail", text: $textFieldText)
                        .padding(.leading, Constants.Padding.padding8)
                    
                    Image(.mic)
                        .resizable()
                        .frame(width: Constants.Frame.size14,
                               height: Constants.Frame.size20)
                        .padding(.trailing, Constants.Padding.padding20)
                }
                
                Divider()
                    .padding(.top, Constants.Padding.padding15)
                    .padding(.bottom, Constants.Padding.padding10)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: Constants.Spacing.spacing12) {
                        Color.clear.frame(width: Constants.Frame.size5,
                                          height: Constants.Frame.size10)
                        if let filters = searchFilters?.filters {
                            ForEach(filters) { filter in
                                SearchOptionsChip(title: filter.title,
                                                  isDropdown: filter.isDropdown)
                            }
                        }
                        Color.clear.frame(width: Constants.Frame.size5,
                                          height: Constants.Frame.size10)
                    }
                }
                Spacer()
            }
            .padding(.top, Constants.Padding.padding10)
        }
        .task {
            do {
                searchFilters = await NetworkingManager.shared.getSearchFilters()
            }
        }
    }
}
