//
//  GCCHomePageVM.swift
//  Gmail-SwiftUI-Combine
//
//  Created by Singh, Ankit on 2024-05-02
//
        
import Foundation
import SwiftUI

extension GCCEmailView {
    class ViewModel: ObservableObject {
        let animationDuration: CGFloat = 0.1
        
        func getLeadingPaddingForComposeBtn(_ immersiveReading: Bool) -> CGFloat {
            immersiveReading ? Constants.Padding.padding15 : Constants.Padding.padding10
        }
        
        func getTrailingPaddingForComposeBtn(_ immersiveReading: Bool) -> CGFloat {
            immersiveReading ? Constants.Padding.padding15 : Constants.Padding.padding25
        }
        
        func getClipShapeForComposeBtn(_ immersiveReading: Bool) -> AnyShape {
            immersiveReading ? AnyShape(Circle()) : AnyShape(Capsule())
        }
        
        func getVerticalOffsetForComposeBtn(_ immersiveReading: Bool) -> CGFloat {
            immersiveReading ? -Constants.Spacing.spacing40 : -Constants.Spacing.spacing70
        }
    }
}
