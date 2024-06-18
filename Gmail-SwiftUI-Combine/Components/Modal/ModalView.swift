//
//  ModalView.swift
//  Gmail-SwiftUI-Combine
//
//  Created by Singh, Ankit on 2024-06-15
//
        

import SwiftUI

struct ModalView: View {
    @Binding var isModalShown: Bool
    
    var body: some View {
        VStack(spacing: Constants.Spacing.spacing15) {
            Text("About suggested people")
                .multilineTextAlignment(.leading)
                .font(.headline)
                .padding(.top, Constants.Padding.padding15)
            
            Text("To make sharing easier, Google suggests people to share with based on your interactions")
                .font(.subheadline)
                .padding(.horizontal, Constants.Padding.padding15)
            
            HStack {
                Spacer()
                
                Button("OK") {
                    isModalShown.toggle()
                }
                .padding(.horizontal, Constants.Padding.padding15)
                .padding(.bottom, Constants.Padding.padding15)
            }
        }
        .background(RoundedRectangle(cornerRadius: Constants.Corner.radius5))
        .background(Constants.darkThemeColorTertiary)
        .padding(.vertical, Constants.Padding.padding15)
        .padding(.horizontal, Constants.Padding.padding35)
        
    }
}

struct BackgroundBlurView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: .light))
        DispatchQueue.main.async {
            view.superview?.superview?.backgroundColor = .clear
        }
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {}
}
