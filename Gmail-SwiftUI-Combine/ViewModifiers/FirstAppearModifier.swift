//
//  FirstAppearModifier.swift
//  Gmail-SwiftUI-Combine
//
//  Created by Singh, Ankit on 2024-05-17
//
        
import Foundation
import SwiftUI

struct FirstAppearModifier: ViewModifier {
    let action: () -> ()
    @State private var didShowFirstAppearMsg: Bool = false
    
    func body(content: Content) -> some View {
        content
            .onAppear {
                guard !didShowFirstAppearMsg else { return }
                    didShowFirstAppearMsg.toggle()
                    action()
                }
            }
    }
}
