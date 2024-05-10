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
                .frame(width: Constants.Frame.size200,
                       height: Constants.Frame.size200)
                .padding()
            
            Text("Get a link you can share")
                .setFont(.title3, color: .white)
                .padding()
            
            HStack {
                Text("Tap ").setFont(.footnote, color: .white) +
                Text("New meeting ").font(.system(.footnote, weight: .semibold)).foregroundColor(.white) +
                Text("to get a link you can send to people you want to meet with").setFont(.footnote, color: .white)
            }
            .padding(.horizontal, Constants.Padding.padding20)
            
            Spacer()
        }
    }
}
