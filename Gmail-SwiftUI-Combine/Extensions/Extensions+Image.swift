//
//  Extensions+Image.swift
//  Gmail-SwiftUI-Combine
//
//  Created by Singh, Ankit on 2024-04-15
//
        
import Foundation
import SwiftUI

extension Image {
    init(_ imageName: Utility.ImageName,
         _ renderedAsTemplate: Bool = true) {
        self = imageName.icon.renderingMode(renderedAsTemplate ? .template : .original)
    }
}
