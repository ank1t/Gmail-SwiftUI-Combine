//
//  SearchViewVM.swift
//  Gmail-SwiftUI-Combine
//
//  Created by Singh, Ankit on 2024-06-05
//
        

import Foundation

extension SearchView {
    
    class ViewModel: ObservableObject {
        
        @Published var searchedEmails: GCCEmail?
        
        func getEmailsContaining(keyword q: String) async {
            Task { @MainActor in
                self.searchedEmails = await NetworkingManager.shared.getEmailsContaining(keyword: q)
            }
        }
    }
}
