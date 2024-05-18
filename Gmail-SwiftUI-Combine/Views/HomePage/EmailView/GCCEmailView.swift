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
    @Binding var shouldShowEmailView: Bool
    @State private var viewModel = ViewModel()
    @State private var shouldShowSearchView: Bool = false
    @State private var searchBarFrame: CGRect = .zero
    
    var body: some View {
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
                                    print("X coordinate: \(searchBarFrame.origin.x + searchBarFrame.size.width)")
                                    print("Y coordinate: \(searchBarFrame.origin.y + searchBarFrame.size.height)")
                                    print("Search bar frame origin \(searchBarFrame.origin)")
                                    print("Search bar frame size \(searchBarFrame.size)")
                                    
                                }
                        }
                        /*
                         X coordinate: 355.0
                         Y coordinate: 105.0
                         Search bar frame origin (20.0, 105.0)
                         Search bar frame size (335.0, 0.0)
                         */
                        HStack(spacing: Constants.Spacing.spacing10) {
                            Image(.moreMenu)
                                .resizable()
                                .frame(width: Constants.Frame.size25,
                                       height: Constants.Frame.size25)
                                .padding(.leading, Constants.Padding.padding20)
                            
                            Text("Search in mail").setFont(.callout,
                                                           color: .gray)
                            .padding(.horizontal, Constants.Padding.padding5)
                            .onTapGesture {
                                shouldShowSearchView.toggle()
                                immersiveReading.toggle()
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
                        GCCEmailRow()
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
                       value: immersiveReading && !shouldShowSearchView)
            
            VStack {
                Spacer()
                SearchView()
                    .frame(maxWidth: shouldShowSearchView ? .infinity : Utility.screenSize.width,
                           maxHeight: shouldShowSearchView ? .infinity : 1)
                    .animation(.default, value: shouldShowSearchView)
                ///10 to account for top padding
                Spacer(minLength: !shouldShowSearchView ?
                       Utility.screenSize.height - (searchBarFrame.origin.y + searchBarFrame.size.height + 10) : 0)
            }
        }
    }
}
