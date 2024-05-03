//
//  GCCHomePage.swift
//  Gmail-SwiftUI-Combine
//
//  Created by Singh, Ankit on 2024-04-13
//
        
import Foundation
import SwiftUI

struct GCCHomePage: View {    
    @Environment(\.colorScheme) var colorScheme
    @State private var searchText: String = ""
    @State private var scrollOffset: CGPoint = .zero
    @State private var shouldHideBottomTabBar: Bool = false
    @State private var viewModel = ViewModel()
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            OffsetObservingScrollView(offset: $scrollOffset) {
                VStack(alignment: .leading,
                       spacing: Constants.Spacing.spacing20) {
                    
                    ZStack {
                        Theme.textFieldBackground(for: colorScheme)
                            .clipShape(RoundedRectangle(cornerRadius: Constants.Corner.radius5))
                        
                        HStack(spacing: Constants.Spacing.spacing10) {
                            Image(.moreMenu)
                                .resizable()
                                .frame(width: Constants.Frame.size25,
                                       height: Constants.Frame.size25)
                                .padding(.leading, Constants.Padding.padding20)
                            
                            Text("Search in mail").setFont(.callout,
                                                           color: .gray)
                            .padding(.horizontal, Constants.Padding.padding5)
                            Spacer()
                            Text("A")
                                .setFont(.title3, color: .white)
                                .padding(Constants.Padding.padding8)
                                .background(.red)
                                .clipShape(Circle())
                                .padding(.trailing, Constants.Padding.padding20)
                            
                        }
                        
                    }
                    .frame(height: Constants.Frame.size50)
                    .padding(.top, Constants.Padding.padding10)
                    
                    
                    Text("INBOX")
                        .setFont(.caption, color: .gray)
                    
                    ForEach(0..<10) { _ in
                        GCCEmailRow()
                    }
                }
                .padding(.horizontal, Constants.Padding.padding20)
            }
            .onChange(of: scrollOffset) { newValue in
                shouldHideBottomTabBar = newValue.y > 5
            }

            Button(action: {}) {
                HStack(spacing: Constants.Spacing.spacing10) {
                    Image(.compose)
                        .resizable()
                        .frame(width: Constants.Frame.size15,
                               height: Constants.Frame.size15)
                    
                    if !shouldHideBottomTabBar {
                        Text("Compose")
                            .font(.subheadline)
                            .fontWeight(.medium)
                    }
                }
                .padding(.vertical, Constants.Padding.padding15)
                .padding(.leading, shouldHideBottomTabBar ? Constants.Padding.padding15 : Constants.Padding.padding10)
                .padding(.trailing, shouldHideBottomTabBar ? Constants.Padding.padding15 : Constants.Padding.padding25)
                .background(Theme.composeBtnBGColor(for: colorScheme))
                .foregroundColor(Theme.tintColor(for: colorScheme))
                .clipShape(shouldHideBottomTabBar ? AnyShape(Circle()) : AnyShape(Capsule()))
                .animation(.easeIn(duration: viewModel.animationDuration), value: shouldHideBottomTabBar)
            }
            .offset(x: -Constants.Spacing.spacing20,
                    y: shouldHideBottomTabBar ? -Constants.Spacing.spacing40 : -Constants.Spacing.spacing70)
            .animation(.easeIn(duration: viewModel.animationDuration), value: shouldHideBottomTabBar)
            
            GCCTabar()
                .frame(height: shouldHideBottomTabBar ? Constants.Frame.size00 : Constants.Frame.size50)
                .animation(.easeIn(duration: viewModel.animationDuration), value: shouldHideBottomTabBar)
        }
        .background(Theme.screenBackground(for: colorScheme))
    }
}
