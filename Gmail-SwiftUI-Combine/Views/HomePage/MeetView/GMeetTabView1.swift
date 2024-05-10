//
//  GMeetTabView1.swift
//  Gmail-SwiftUI-Combine
//
//  Created by Singh, Ankit on 2024-05-09
//
        
import Foundation
import SwiftUI

struct GMeetTabView1: View {
    var body: some View {
        VStack {
            Image(.shareLink, false)
                .resizable()
                .frame(width: Constants.Frame.size300,
                       height: Constants.Frame.size300)
                .padding()
            
            Text("Get a link you can share")
                .setFont(.title3, color: .white)
            
            Text("Tap ").setFont(.footnote, color: .white) + Text("New meeting").setFont(.footnote, color: .white).fontWeight(.medium)
            Spacer()
        }
    }
}
