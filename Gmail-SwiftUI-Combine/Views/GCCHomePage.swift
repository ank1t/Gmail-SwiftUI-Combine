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
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            VStack(alignment: .leading,
                   spacing: Constants.Spacing.spacing20) {
                
                ZStack {
                    Theme.textFieldBackground(for: colorScheme)
                        .clipShape(RoundedRectangle(cornerRadius: Constants.Corner.radius5))
                        .padding(.horizontal, Constants.Padding.padding20)
                        
                    
                    HStack(spacing: Constants.Spacing.spacing10) {
                        Image(.moreMenu)
                            .resizable()
                            .frame(width: Constants.Frame.size25,
                                   height: Constants.Frame.size25)
                            .padding(.leading, Constants.Padding.padding35)
                        
                        TextField("Title", text: $searchText,
                                  prompt: Text("Search in mail").setFont(.callout,
                                                                         color: .gray))
                        .padding(.horizontal, Constants.Padding.padding5)
                        
                        Text("A")
                            .setFont(.title3, color: .white)
                            .padding(Constants.Padding.padding8)
                            .background(.red)
                            .clipShape(Circle())
                            .padding(.trailing, Constants.Padding.padding30)
                            
                    }
                    
                }
                .frame(height: Constants.Frame.size50)
                .padding(.top, Constants.Padding.padding10)
                
                
                Text("INBOX")
                    .setFont(.caption, color: .gray)
                    .padding(.horizontal, Constants.Padding.padding15)
                
                ForEach(0..<1) {_ in 
                    GCCEmailRow(viewModel: GCCEmailRowVM())
                }
                .padding(.horizontal, Constants.Padding.padding20)
                
                Spacer()
            }
        }
        .background(Theme.screenBackground(for: colorScheme))
    }
}
