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
    
    @StateObject private var viewModel = ViewModel()
    @State private var rotationAngle: Double = 0
    @State private var leadingPadding: Double = Constants.Padding.padding35
    @State private var textFieldText: String = ""
    @State private var labelSearchText: String = ""
    let searchFilters: SearchFilters?
    @State private var dropdownSheetIsPresented: Bool = false
    @State var selectedFilter: FiltersByIndex = .attachment
    @State var isShowingDatePickerForCustomRange: Bool = false
    @State var dateFilterPresentationDetent: PresentationDetent = .height(Constants.Frame.size350)
    
    let dateFilterPresentationDetents: Set<PresentationDetent> = [.height(Constants.Frame.size350),
                                                                  .height(Constants.Frame.size450)]
    let scrollViewID = UUID()
    
    var body: some View {
        ZStack {
            Theme.primaryColor(for: colorScheme)
            VStack(spacing: 0) {
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
                            textFieldText = ""
                            viewModel.searchedEmails = nil
                        }
                    
                    TextField("Search in mail", text: $textFieldText)
                        .padding(.leading, Constants.Padding.padding8)
                    
                    if !textFieldText.isEmpty && viewModel.searchedEmails == nil {
                        ProgressView()
                            .tint(.blue)
                            .frame(width: Constants.Frame.size14,
                                   height: Constants.Frame.size14)
                            .padding(.horizontal, Constants.Spacing.spacing10)
                    }
                    
                    if textFieldText.isEmpty {
                        Image(.mic)
                            .resizable()
                            .frame(width: Constants.Frame.size14,
                                   height: Constants.Frame.size20)
                            .padding(.trailing, Constants.Padding.padding20)
                    } else {
                        Image(.close)
                            .resizable()
                            .frame(width: Constants.Frame.size14,
                                   height: Constants.Frame.size14)
                            .padding(.trailing, Constants.Padding.padding20)
                            .onTapGesture {
                                if !textFieldText.isEmpty {
                                    textFieldText = ""
                                    viewModel.searchedEmails = nil
                                }
                            }
                    }
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
                
                ScrollView {
                    if textFieldText.isEmpty {
                        Group {
                            HStack {
                                Text("RECENT MAIL SEARCHES")
                                    .font(.caption)
                                    .padding(.bottom, Constants.Padding.padding15)
                                    .padding(.leading, Constants.Padding.padding15)
                                Spacer()
                            }
                            
                            VStack {
                                ForEach(searchFilters?.recentSearches ?? [], id: \.self) { searchItem in
                                    RecentSearchItem(searchText: searchItem)
                                        .padding(.leading, Constants.Frame.size20)
                                        .onTapGesture {
                                            textFieldText = searchItem
                                            Task {
                                                try await Task.sleep(nanoseconds: 1_000_000_000)
                                                await viewModel.getEmailsContaining(keyword: searchItem)
                                            }
                                        }
                                }
                                Spacer()
                                    .frame(height: Constants.Frame.size20)
                            }
                        }
                    } else if !textFieldText.isEmpty && viewModel.searchedEmails != nil {
                        LazyVStack {
                            ForEach(0..<100) {_ in
                                GCCEmailRow(shouldBoldTitleAndSubtitle: true)
                            }
                        }
                        .padding(.horizontal, Constants.Spacing.spacing20)
                    } else {
                        Spacer()
                    }
                }
            }
            .padding(.top, Constants.Padding.padding10)
        }
        .sheet(isPresented: $dropdownSheetIsPresented, content: {
            selectFilterOptionsView(filter: selectedFilter)
        })
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
                                               options: options.attachmentLabelOptions ?? [])
                        .presentationDetents([.large]))
                }
            case .from:
                if let options = searchFilters?.filters[selectedFilter.rawValue] {
                    return AnyView(FromToSearchOptionsView(type: selectedFilter == .from ? .from : .to,
                                                           options: options.fromToOptions ?? [],
                                                           shouldHideDropdownSheet: $dropdownSheetIsPresented)
                        .presentationDetents([.large]))
                }
            case .to:
                if let options = searchFilters?.filters[selectedFilter.rawValue] {
                    return AnyView(FromToSearchOptionsView(type: selectedFilter == .from ? .from : .to,
                                                           options: options.fromToOptions ?? [],
                                                           shouldHideDropdownSheet: $dropdownSheetIsPresented)
                        .presentationDetents([.large]))
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
