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

protocol ImageTitleSubtitle {
    var title: String { get }
    var subtitle: String { get }
    var icon: String { get }
}

struct SearchFilters: Codable {
    let filters: [SearchFilter]
}

struct SearchFilter: Codable, Identifiable {
    let id = UUID()
    let title: String
    let isDropdown: Bool
    let attachmentLabelOptions: [AttachmentLabelOptions]?
}

struct AttachmentLabelOptions: Codable, TitleImageName {
    let title: String
    let icon: String
}

struct FromToOptions: Codable, ImageTitleSubtitle {
    let title: String
    let subtitle: String
    let icon: String
}
