//
//  GCCHomePageVM.swift
//  Gmail-SwiftUI-Combine
//
//  Created by Singh, Ankit on 2024-07-09
//
        
import Foundation

extension GCCHomePage {
    class ViewModel: ObservableObject {
        @Published var searchFilters: SearchFilters?
        
        func getSearchFilters() async {
            Task { @MainActor in
                self.searchFilters = await NetworkingManager.shared.getSearchFilters()
            }
        }
    }
}
