//
//  SearchView.swift
//  Gmail-SwiftUI-Combine
//
//  Created by Singh, Ankit on 2024-05-12
//
        
import Foundation
import SwiftUI

struct SearchView: View {
    @Environment(\.colorScheme) var colorScheme
    
    @Binding var shouldShowSearchView: Bool
    
    @State private var viewModel = ViewModel()
    @State private var rotationAngle: Double = 0
    @State private var leadingPadding: Double = Constants.Padding.padding35
    @State private var textFieldText: String = ""
    @State private var labelSearchText: String = ""
    @State var searchFilters: SearchFilters?
    @State private var dropdownSheetIsPresented: Bool = false
    @State var selectedFilter: FiltersByIndex = .attachment
    @State var isShowingDatePickerForCustomRange: Bool = false
    @State var dateFilterPresentationDetent: PresentationDetent = .height(Constants.Frame.size350)
    
    let dateFilterPresentationDetents: Set<PresentationDetent> = [.height(Constants.Frame.size350),
                                                                  .height(Constants.Frame.size450)]
    
    var body: some View {
        ZStack {
            Theme.primaryColor(for: colorScheme)
            VStack {
                HStack {
                    Image(.backChevron)
                        .resizable()
                        .frame(width: Constants.Frame.size10,
                               height: Constants.Frame.size15)
                        .padding(.leading, leadingPadding)
                        .rotationEffect(Angle(degrees: rotationAngle))
                        .onAppear {
                            leadingPadding = Constants.Padding.padding15
                        }
                        .onTapGesture {
                            shouldShowSearchView = false
                        }
                        .animation(.spring(), value: leadingPadding)
                    
                    TextField("Search in mail", text: $textFieldText)
                        .padding(.leading, Constants.Padding.padding8)
                    
                    Image(.mic)
                        .resizable()
                        .frame(width: Constants.Frame.size14,
                               height: Constants.Frame.size20)
                        .padding(.trailing, Constants.Padding.padding20)
                }
                
                Divider()
                    .padding(.top, Constants.Padding.padding15)
                    .padding(.bottom, Constants.Padding.padding10)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: Constants.Spacing.spacing12) {
                        Color.clear.frame(width: Constants.Frame.size5,
                                          height: Constants.Frame.size10)
                        if let filters = searchFilters?.filters {
                            ForEach(Array(zip(filters.indices, filters)), id: \.1.id) { index, filter in
                                SearchOptionsChip(title: filter.title,
                                                  isDropdown: filter.isDropdown)
                                .onTapGesture {
                                    if let filter = FiltersByIndex(rawValue: index) {
                                        selectedFilter = filter
                                    }
                                    dropdownSheetIsPresented.toggle()
                                }
                            }
                        }
                        Color.clear.frame(width: Constants.Frame.size5,
                                          height: Constants.Frame.size10)
                    }
                }
                .padding(.bottom, Constants.Padding.padding15)
                
                VStack {
                    Text("RECENT MAIL SEARCHES")
                        .font(.caption)
                        .padding(.bottom, Constants.Padding.padding15)
                    
                    ScrollView {
                        VStack {
                            
                        }
                    }
                }
                
                Spacer()
            }
            .padding(.top, Constants.Padding.padding10)
        }
        .sheet(isPresented: $dropdownSheetIsPresented, content: {
            selectFilterOptionsView(filter: selectedFilter)
        })
        .task {
            do {
                searchFilters = 
            }
        }
        .onChange(of: isShowingDatePickerForCustomRange) { value in
            let detent: PresentationDetent = value ? .height(450) : .height(350)
            dateFilterPresentationDetent = detent
        }
    }
    
    func selectFilterOptionsView(filter: FiltersByIndex) -> AnyView {
        guard filter != .none else { return AnyView(EmptyView()) }
        switch selectedFilter {
            case .label:
                if let options = searchFilters?.filters[selectedFilter.rawValue] {
                    return AnyView(AttachmentLabelOptionsView(type: .label,
                                               textFieldText: $labelSearchText,
                                               shouldHideDropdownSheet: $dropdownSheetIsPresented,
                                               options: options.attachmentLabelOptions ?? []))
                }
            case .from:
                if let options = searchFilters?.filters[selectedFilter.rawValue] {
                    return AnyView(FromToSearchOptionsView(type: selectedFilter == .from ? .from : .to,
                                                           options: options.fromToOptions ?? [],
                                                           shouldHideDropdownSheet: $dropdownSheetIsPresented))
                }
            case .to:
                if let options = searchFilters?.filters[selectedFilter.rawValue] {
                    return AnyView(FromToSearchOptionsView(type: selectedFilter == .from ? .from : .to,
                                                           options: options.fromToOptions ?? [],
                                                           shouldHideDropdownSheet: $dropdownSheetIsPresented))
                }
            case .attachment:
                if let options = searchFilters?.filters[selectedFilter.rawValue] {
                    return AnyView(AttachmentLabelOptionsView(type: .attachments,
                                               textFieldText: $labelSearchText,
                                               shouldHideDropdownSheet: $dropdownSheetIsPresented,
                                               options: options.attachmentLabelOptions ?? [])
                        .presentationDetents([.height(Constants.Frame.size410)]))
                }
            case .date:
                if let options = searchFilters?.filters[selectedFilter.rawValue] {
                    return AnyView(
                        DateSearchOptionsView(shouldHideDropdownSheet: $dropdownSheetIsPresented,
                                              options: options.dateOptions ?? [],
                                              isShowingDatePickerForCustomRange: $isShowingDatePickerForCustomRange)
                        .presentationDetents(dateFilterPresentationDetents,
                                             selection: $dateFilterPresentationDetent)
                        .presentationDragIndicator(.hidden)
                    )
                }
            case .isRead:
                break
            case .excludesCalendarUpdates:
                break
            default:
                break
        }
        return AnyView(EmptyView())
    }
}

extension SearchView {
    enum FiltersByIndex: Int, Identifiable {
        var id: Self {
            return self
        }
        case label = 0
        case from
        case to
        case attachment
        case date
        case isRead
        case excludesCalendarUpdates
        case none
    }
}
