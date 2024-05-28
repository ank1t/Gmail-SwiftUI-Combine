//
//  SearchFilters.swift
//  Gmail-SwiftUI-Combine
//
//  Created by Singh, Ankit on 2024-05-27
//
        
import Foundation

struct SearchFilters: Codable {
    let filters: [Filter]
    
}

struct Filter: Codable {
    let filterName: String
}
