//
//  CustomDateView.swift
//  Gmail-SwiftUI-Combine
//
//  Created by Singh, Ankit on 2024-06-09
//
        

import SwiftUI

struct CustomDateView: View {
    @State private var fromDate = Date.now
    @State private var toDate = Date.now
    
    var body: some View {
        VStack {
        //From date
        HStack {
            DatePicker(selection: $fromDate, in: ...Date.now, displayedComponents: .date) {
                Text("From date")
            }
            .padding(.horizontal, Constants.Padding.padding15)
        }
            
        HStack {
            DatePicker(selection: $fromDate, in: ...Date.now, displayedComponents: .date) {
                Text("To date")
            }
            .padding(.horizontal, Constants.Padding.padding15)
        }
    }
}

struct CustomDateView_Previews: PreviewProvider {
    static var previews: some View {
        CustomDateView()
    }
}
