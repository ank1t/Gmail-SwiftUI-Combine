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
            let filters = await NetworkingManager.shared.getSearchFilters()
            DispatchQueue.main.async { [weak self] in
                self?.searchFilters = filters
            }
        }
    }
}
