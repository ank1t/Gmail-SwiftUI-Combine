//
//  SearchViewVM.swift
//  Gmail-SwiftUI-Combine
//
//  Created by Singh, Ankit on 2024-06-05
//
        

import Foundation

extension SearchView {
    
    class ViewModel: ObservableObject {
        @Published var searchFilters: SearchFilters?
        
        func getSearchFilters() async {
            Task { @MainActor in
                self.searchFilters = await NetworkingManager.shared.getSearchFilters()
            }
        }
    }
}
