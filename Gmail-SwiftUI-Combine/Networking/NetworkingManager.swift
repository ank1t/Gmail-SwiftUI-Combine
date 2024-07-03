//
//  NetworkingManager.swift
//  Gmail-SwiftUI-Combine
//
//  Created by Singh, Ankit on 2024-04-13
//
        
import Foundation

class NetworkingManager {
    static let shared = NetworkingManager()
    private init() { }
    
    func getLatestEmails() { }
    
    func getSearchFilters() async -> SearchFilters? {
        if let path = Bundle.main.path(forResource: "search_filters", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path))
                return try JSONDecoder().decode(SearchFilters.self, from: data)
            } catch {
                print("Error parsing search filters")
            }
        }
        return nil
    }
    
    func getEmailsContaining(keyword q: String) async -> GCCEmail? {
        if let path = Bundle.main.path(forResource: "emails", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path))
                return try JSONDecoder().decode(GCCEmail.self, from: data)
            } catch {
                print("Error searching for emails with keyword \(q)")
            }
        }
        return nil
    }
}
