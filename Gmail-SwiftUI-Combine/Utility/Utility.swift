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
        case star
        case compose = "pencil"
        case email = "envelope"
        case meet = "video"
        case archive = "archivebox"
        case garbage = "xmark.bin"
        case unreadMail = "envelope.badge"
        case shareLink = "share-link"
        case lock
        case mic = "mic.fill"
        case backChevron = "chevron.backward"
        case dropdownArrow = "arrowtriangle.down.fill"
        case history = "clock.arrow.circlepath"
        case close = "xmark"
        case info = "info.circle"
        case check = "checkmark.circle"
        case gmail
        
        var icon: Image {
            guard let image = UIImage(named: self.rawValue) else {
                return Image(systemName: self.rawValue)
            }
            return Image(uiImage: image)
        }
    }
    
    static var screenSize: CGSize {
        UIScreen.main.bounds.size
    }
}
