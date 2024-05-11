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
                .padding(.horizontal)
                .padding(.bottom, Constants.Padding.padding10)
            
            HStack {
                //This can be used to get an attributed string effect
                let t = Text("Tap ").setFont(.callout, color: .white) +
                Text("New meeting ").font(.system(.callout, weight: .semibold)).foregroundColor(.white) +
                Text("to get a link you can send to people you want to meet with").setFont(.callout, color: .white)
                
                t.multilineTextAlignment(.center)
            }
            .padding(.horizontal, Constants.Padding.padding20)
            
            Spacer()
        }
    }
}
