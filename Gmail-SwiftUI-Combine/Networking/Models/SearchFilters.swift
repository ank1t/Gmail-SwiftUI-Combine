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
    var name: String { get }
    var email: String { get }
    var icon: String { get }
}

struct SearchFilters: Codable {
    let filters: [SearchFilter]
    let recentSearches: [String]?
}

struct SearchFilter: Codable, Identifiable {
    var id = UUID()
    let title: String
    let isDropdown: Bool
    let attachmentLabelOptions: [AttachmentLabelOptions]?
    let fromToOptions: [FromToOptions]?
    let dateOptions: [String]?
}

struct AttachmentLabelOptions: Codable, TitleImageName, Identifiable {
    var id = UUID()
    let title: String
    let icon: String
    let count: Int?
}

struct FromToOptions: Codable, ImageTitleSubtitle, Identifiable {
    var id = UUID()
    let name: String
    let email: String
    let icon: String
}

