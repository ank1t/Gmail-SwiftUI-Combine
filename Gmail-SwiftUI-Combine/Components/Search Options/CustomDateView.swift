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
    
    /*
     Date pickers dont dismiss themselves when a date is selected.
     Using below state vars, forcing them to re-render.
     */
    @State private var fromDateCalendarID = UUID()
    @State private var toDateCalendarID = UUID()
    
    var body: some View {
        VStack {
            //From date
            HStack {
                DatePicker(selection: $fromDate, in: ...Date.now, displayedComponents: .date) {
                    Text("From date")
                }
                .id(fromDateCalendarID)
                .onChange(of: fromDate, perform: { _ in
                    fromDateCalendarID = UUID()
                })
                .padding(.horizontal, Constants.Padding.padding20)
            }
            
            HStack {
                DatePicker(selection: $toDate, in: ...Date.now, displayedComponents: .date) {
                    Text("To date")
                }
                .id(toDateCalendarID)
                .onChange(of: toDate, perform: { _ in
                    toDateCalendarID = UUID()
                })
                .padding(.horizontal, Constants.Padding.padding20)
            }
        }
    }
}

struct CustomDateView_Previews: PreviewProvider {
    static var previews: some View {
        CustomDateView()
    }
}
