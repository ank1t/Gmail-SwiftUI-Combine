//
//  SearchViewVM.swift
//  Gmail-SwiftUI-Combine
//
//  Created by Singh, Ankit on 2024-06-05
//
        

import Foundation

extension SearchView {
    
    class ViewModel: ObservableObject {
        private(set) var filters: SearchFilters?
        
        func getSearchFilters() async {
            filters = await NetworkingManager.shared.getSearchFilters()
        }
    }
}
