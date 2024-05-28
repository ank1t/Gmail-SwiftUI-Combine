//
//  SearchFilters.swift
//  Gmail-SwiftUI-Combine
//
//  Created by Singh, Ankit on 2024-05-27
//
        
import Foundation

struct SearchFilters: Codable {
    let filters: [SearchFilter]
}

struct SearchFilter: Codable, Identifiable {
    let id = UUID()
    let title: String
    let isDropdown: Bool
}
