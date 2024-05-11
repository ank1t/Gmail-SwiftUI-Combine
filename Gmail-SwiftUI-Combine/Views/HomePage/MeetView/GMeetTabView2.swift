//
//  GMeetTabView2.swift
//  Gmail-SwiftUI-Combine
//
//  Created by Singh, Ankit on 2024-05-09
//
        
import Foundation
import SwiftUI

struct GMeetTabView2: View {
    var body: some View {
        VStack {
            Image(.lock, false)
                .resizable()
                .frame(width: Constants.Frame.size200,
                       height: Constants.Frame.size200)
                .padding()
            
            Text("Your meeting is safe")
                .setFont(.title3, color: .white)
                .padding(.horizontal)
                .padding(.bottom, Constants.Padding.padding10)
            
            Text("No one can join a meeting unless invited or admitted by the host").setFont(.callout, color: .white)
            .padding(.horizontal, Constants.Padding.padding20)
            .multilineTextAlignment(.center)
            
            Spacer()
        }
    }
}

