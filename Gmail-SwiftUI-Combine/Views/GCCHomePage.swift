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
                   spacing: Constants.Spacing.spacing10) {
                
                ZStack {
                    Theme.textFieldBackground(for: colorScheme)
                        .clipShape(RoundedRectangle(cornerRadius: Constants.Corner.radius5))
                        .padding(.horizontal, Constants.Padding.padding15)
                        
                    
                    TextField("Title", text: $searchText,
                              prompt: Text("Search in mail"))
                    .padding(.horizontal, Constants.Padding.padding50)
                }
                .frame(height: 50)
                .padding(.top, Constants.Padding.padding10)
                
                
                Text("INBOX")
                
                Spacer()
            }
        }
        .background(Theme.screenBackground(for: colorScheme))
    }
}
