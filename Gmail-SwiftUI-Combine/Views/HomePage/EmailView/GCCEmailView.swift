//
//  EmailView.swift
//  Gmail-SwiftUI-Combine
//
//  Created by Singh, Ankit on 2024-05-06
//
        
import Foundation
import SwiftUI

struct GCCEmailView: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var scrollOffset: CGPoint = .zero
    @State private var previousYOffset: CGFloat = 0
    @Binding var immersiveReading: Bool
    @State private var viewModel = ViewModel()
    @State private var shouldShowSearchView: Bool = false
    @Binding var slidingMenuIsShowing: Bool
    @Binding var searchBarFrame: CGRect
    let edgeTransition: AnyTransition = .move(edge: .top)
    let searchFilters: SearchFilters?
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottomTrailing) {
                OffsetObservingScrollView(offset: $scrollOffset) {
                    LazyVStack(alignment: .leading,
                               spacing: Constants.Spacing.spacing20) {
                        ZStack {
                            GeometryReader { reader in
                                Theme.textFieldBackground(for: colorScheme)
                                    .clipShape(RoundedRectangle(cornerRadius: Constants.Corner.radius5))
                                    .onFirstAppear {
                                        searchBarFrame = reader.frame(in: .global)
                                    }
                            }
                            HStack(spacing: Constants.Spacing.spacing10) {
                                Image(.moreMenu)
                                    .resizable()
                                    .frame(width: Constants.Frame.size25,
                                           height: Constants.Frame.size25)
                                    .padding(.leading, Constants.Padding.padding20)
                                    .onTapGesture {
                                        slidingMenuIsShowing.toggle()
                                    }
                                
                                Text("Search in mail").setFont(.callout,
                                                               color: .gray)
                                .padding(.horizontal, Constants.Padding.padding5)
                                .onTapGesture {
                                    shouldShowSearchView = true
                                    immersiveReading = true
                                }
                                
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
                        
                        ForEach(0..<50) { _ in
                            NavigationLink {
                                Text("Link")
                            } label: {
                                GCCEmailRow()
                            }
                        }
                    }
                               .padding(.horizontal, Constants.Padding.padding20)
                }
                .onChange(of: scrollOffset) { newValue in
                    if previousYOffset < newValue.y {
                        if !immersiveReading {
                            immersiveReading = true
                        }
                    } else if immersiveReading {
                        immersiveReading = false
                    }
                    previousYOffset = newValue.y
                }
                
                Button(action: {}) {
                    HStack(spacing: Constants.Spacing.spacing10) {
                        Image(.compose)
                            .resizable()
                            .frame(width: Constants.Frame.size15,
                                   height: Constants.Frame.size15)
                        
                        if !immersiveReading {
                            Text("Compose")
                                .font(.subheadline)
                                .fontWeight(.medium)
                        }
                    }
                    .padding(.vertical, Constants.Padding.padding15)
                    .padding(.leading, viewModel.getLeadingPaddingForComposeBtn(immersiveReading))
                    .padding(.trailing, viewModel.getTrailingPaddingForComposeBtn(immersiveReading))
                    .background(Theme.composeBtnBGColor(for: colorScheme))
                    .foregroundColor(Theme.tintColor(for: colorScheme))
                    .clipShape(viewModel.getClipShapeForComposeBtn(immersiveReading))
                    .animation(.easeIn(duration: viewModel.animationDuration),
                               value: immersiveReading)
                }
                .offset(x: -Constants.Spacing.spacing20,
                        y: viewModel.getVerticalOffsetForComposeBtn(immersiveReading))
                .animation(.easeIn(duration: viewModel.animationDuration),
                           value: immersiveReading)
                
                VStack {
                    Spacer()
                    SearchView(shouldShowSearchView: $shouldShowSearchView,
                               searchFilters: searchFilters)
                    .frame(maxWidth: Utility.screenSize.width,
                           maxHeight: shouldShowSearchView ? Utility.screenSize.height : 0)
                    .transition(edgeTransition)
                    .opacity(shouldShowSearchView ? 1 : 0)
                    .animation(.default, value: shouldShowSearchView)
                    .onChange(of: shouldShowSearchView) { newValue in
                        if !newValue {
                            immersiveReading = false
                        }
                    }

                    ///10 to account for top padding
                    Spacer(minLength: !shouldShowSearchView ?
                           Utility.screenSize.height - (searchBarFrame.origin.y + searchBarFrame.size.height + 10) : 0)
                }
            }
        }
    }
}
