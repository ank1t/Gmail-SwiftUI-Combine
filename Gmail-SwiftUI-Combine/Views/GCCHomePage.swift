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
            ScrollView(showsIndicators: false) {
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
                            
                            TextField("Title", text: $searchText,
                                      prompt: Text("Search in mail").setFont(.callout,
                                                                             color: .gray))
                            .padding(.horizontal, Constants.Padding.padding5)
                            
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
                            .gesture(
                                DragGesture()
                                    .onChanged({ gesture in
                                        print(gesture)
                                    })
                            )
                    }
                }
                .padding(.horizontal, Constants.Padding.padding20)
            }
        }
        .background(Theme.screenBackground(for: colorScheme))
    }
}
