//
//  Utility.swift
//  Gmail-SwiftUI-Combine
//
//  Created by Singh, Ankit on 2024-04-13
//
        
import Foundation
import SwiftUI

struct Utility {
    
    enum ImageName: String {
        case moreMenu = "more_menu"
        case user = "person.circle.fill"
        
        var icon: Image {
            guard let image = UIImage(named: self.rawValue) else {
                return Image(systemName: self.rawValue)
            }
            return Image(uiImage: image)
        }
    }
}
