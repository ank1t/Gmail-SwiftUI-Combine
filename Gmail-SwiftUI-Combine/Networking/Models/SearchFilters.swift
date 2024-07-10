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
    let id: UUID
    let title: String
    let isDropdown: Bool
    let attachmentLabelOptions: [AttachmentLabelOptions]?
    let fromToOptions: [FromToOptions]?
    let dateOptions: [String]?
    
    private enum CodingKeys: String, CodingKey {
        case id, title, isDropdown, attachmentLabelOptions, fromToOptions, dateOptions
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(UUID.self, forKey: .id) ?? UUID()
        self.title = try container.decode(String.self, forKey: .title)
        self.isDropdown = try container.decode(Bool.self, forKey: .isDropdown)
        self.attachmentLabelOptions = try container.decodeIfPresent([AttachmentLabelOptions].self, forKey: .attachmentLabelOptions)
        self.fromToOptions = try container.decodeIfPresent([FromToOptions].self, forKey: .fromToOptions)
        self.dateOptions = try container.decodeIfPresent([String].self, forKey: .dateOptions)
    }
}

struct AttachmentLabelOptions: Codable, TitleImageName, Identifiable {
    let id: UUID
    let title: String
    let icon: String
    let count: Int?
    
    private enum CodingKeys: String, CodingKey {
        case id, title, icon, count
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(UUID.self, forKey: .id) ?? UUID()
        self.title = try container.decode(String.self, forKey: .title)
        self.icon = try container.decode(String.self, forKey: .icon)
        self.count = try container.decodeIfPresent(Int.self, forKey: .count)
    }
}

struct FromToOptions: Codable, ImageTitleSubtitle, Identifiable {
    let id = UUID()
    let name: String
    let email: String
    let icon: String
}

