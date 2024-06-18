//
//  ModalView.swift
//  Gmail-SwiftUI-Combine
//
//  Created by Singh, Ankit on 2024-06-15
//
        

import SwiftUI

struct ModalView: View {
    let title: String
    let subtitle: String
    let ctaText: String
    
    @Binding var isModalShown: Bool
    
    var body: some View {
        VStack(spacing: Constants.Spacing.spacing15) {
            Text(title)
                .multilineTextAlignment(.leading)
                .font(.headline)
                .padding(.top, Constants.Padding.padding20)
            
            Text(subtitle)
                .font(.subheadline)
                .padding(.horizontal, Constants.Padding.padding15)
            
            HStack {
                Spacer()
                
                Button(ctaText) {
                    isModalShown.toggle()
                }
                .padding(.horizontal, Constants.Padding.padding15)
                .padding(.bottom, Constants.Padding.padding20)
            }
        }
        .background(Constants.darkThemeColorTertiary)
        .clipShape(RoundedRectangle(cornerRadius: Constants.Corner.radius5))
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
