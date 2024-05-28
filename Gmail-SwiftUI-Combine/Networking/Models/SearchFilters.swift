//
//  SearchFilters.swift
//  Gmail-SwiftUI-Combine
//
//  Created by Singh, Ankit on 2024-05-27
//
        
import Foundation

protocol TitleImageName {
    var title: String { get }
    var icon: String { get }
}

struct SearchFilters: Codable {
    let filters: [SearchFilter]
}

struct SearchFilter: Codable, Identifiable {
    let id = UUID()
    let title: String
    let isDropdown: Bool
    let attachmentOptions: [AttachmentOptions]?
    let labelOptions: [LabelOptions]?
}

struct AttachmentOptions: Codable, TitleImageName {
    let title: String
    let icon: String
}

struct LabelOptions: Codable, TitleImageName {
    let title: String
    let icon: String
}
