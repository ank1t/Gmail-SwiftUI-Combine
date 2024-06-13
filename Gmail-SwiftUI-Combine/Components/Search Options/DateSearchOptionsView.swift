//
//  DateSearchOptionsView.swift
//  Gmail-SwiftUI-Combine
//
//  Created by Singh, Ankit on 2024-06-09
//
        

import SwiftUI

struct DateSearchOptionsView: View {
    @Binding var shouldHideDropdownSheet: Bool
    let options: [String]
    @Binding var isShowingDatePickerForCustomRange: Bool
    
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
                
                Text("Date")
                    .setFont(.title3, color: .white)
                
                Spacer()
            }
            .padding(.top, Constants.Padding.padding20)
            .padding(.bottom, Constants.Padding.padding10)
            
            Divider()
            
            ScrollView {
                LazyVStack(alignment: .leading) {
                    ForEach(options, id: \.self) { option in
                        IconTitleView(utilityIcon: .check,
                                      title: option.capitalized)
                    }
                    Text("Custom range")
                        .setFont(.callout, color: .red)
                        .padding(.leading, Constants.Padding.padding80)
                        .onTapGesture {
                            withAnimation {
                                isShowingDatePickerForCustomRange.toggle()
                            }
                        }
                }
            }
        }
        .background(.clear)
    }
}
