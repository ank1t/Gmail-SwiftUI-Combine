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
    @State private var immersiveReading: Bool = false
    @Binding var shouldShowEmailView: Bool
    @State private var viewModel = ViewModel()
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            OffsetObservingScrollView(offset: $scrollOffset) {
                LazyVStack(alignment: .leading,
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
                } else if immersiveReading{
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
                .animation(.easeIn(duration: viewModel.animationDuration), value: immersiveReading)
            }
            .offset(x: -Constants.Spacing.spacing20,
                    y: viewModel.getVerticalOffsetForComposeBtn(immersiveReading))
            .animation(.easeIn(duration: viewModel.animationDuration), value: immersiveReading)
            
            GCCTabar(shouldShowEmailView: $shouldShowEmailView)
                .frame(height: immersiveReading ? Constants.Frame.size00 : Constants.Frame.size50)
                .animation(.easeIn(duration: viewModel.animationDuration), value: immersiveReading)
        }
        .background(Theme.screenBackground(for: colorScheme))
    }
}
