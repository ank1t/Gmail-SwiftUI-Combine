//
//  ContentView.swift
//  Gmail-SwiftUI-Combine
//
//  Created by Singh, Ankit on 2024-04-09
//
        

import SwiftUI

struct ContentView: View {
    @Environment(\.colorScheme) private var colorScheme: ColorScheme
    
    var body: some View {
        GCCHomePage()
            .preferredColorScheme(colorScheme)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
