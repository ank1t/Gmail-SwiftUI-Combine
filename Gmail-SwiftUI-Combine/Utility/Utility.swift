//
//  Utility.swift
//  Gmail-SwiftUI-Combine
//
//  Created by Singh, Ankit on 2024-04-13
//
        
import Foundation
import SwiftUI

struct Utility {
    
    enum Image: String {
        case moreMenu = "more_menu"
        
        var icon: Image {
            guard let image = Image(self.rawValue) else {
                return Image(systemName: self.rawValue)
            }
            return Image
        }
    }
}
