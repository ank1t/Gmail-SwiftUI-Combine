//
//  NetworkingManager.swift
//  Gmail-SwiftUI-Combine
//
//  Created by Singh, Ankit on 2024-04-13
//
        
import Foundation

class NetworkingManager: ObservableObject {
    enum LoadingState {
        case idle
        case loading
        case fetchedFilters(SearchFilters?)
        case failed(Error)
    }
    
    static let shared = NetworkingManager()
    @Published var apiState: LoadingState = .idle
    
    private init() { }
    
    func getLatestEmails() { }
    
    func getSearchFilters() async -> SearchFilters? {
        apiState = .loading
        if let path = Bundle.main.path(forResource: "search_filters", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path))
                let filters =  try JSONDecoder().decode(SearchFilters.self, from: data)
                apiState = .fetchedFilters(filters)
                return filters
            } catch {
                apiState = .failed(APIErrors.callFailed)
                print("Error parsing search filters")
            }
        }
        return nil
    }
}

extension NetworkingManager  {
    enum APIErrors: Error {
        case callFailed
    }
}
