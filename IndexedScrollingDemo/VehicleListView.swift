//
//----------------------------------------------
// Original project: IndexedScrollingDemo
//
// Follow me on Mastodon: https://iosdev.space/@StewartLynch
// Follow me on Threads: https://www.threads.net/@stewartlynch
// Follow me on Bluesky: https://bsky.app/profile/stewartlynch.bsky.social
// Follow me on X: https://x.com/StewartLynch
// Follow me on LinkedIn: https://linkedin.com/in/StewartLynch
// Email: slynch@createchsol.com
// Subscribe on YouTube: https://youTube.com/@StewartLynch
// Buy me a ko-fi:  https://ko-fi.com/StewartLynch
//----------------------------------------------
// Copyright © 2026 CreaTECH Solutions (Stewart Lynch). All rights reserved.


import SwiftUI

enum SortOption: String, CaseIterable {
    case name = "Name"
    case make = "Make"
    case licencePlate = "Plate"
    case state_prov = "State/Prov"
}

struct VehicleListView: View {
    let vehicles = Vehicle.mockData
    @State private var searchText = ""
    @State private var sortOption: SortOption = .name
    let numbers = (0...9).map { String($0) }
    let letters = (0..<26).map {String(UnicodeScalar(65 + $0)!)}
    @State private var selectedIndex = "A"
    @State private var scrollPosition = ScrollPosition()
    var column: [String] {
        switch sortOption {
        case .licencePlate:
            numbers + letters
        default:
            letters
        }
    }
    var filteredAndSortedVehicles: [Vehicle] {
        let filteredVehicles = searchText.isEmpty ? vehicles : vehicles.filter { vehicle in
            vehicle.owner.localizedCaseInsensitiveContains(searchText) ||
            vehicle.make.localizedCaseInsensitiveContains(searchText) ||
            vehicle.licencePlate.localizedCaseInsensitiveContains(searchText) ||
            vehicle.state_Prov.localizedCaseInsensitiveContains(searchText)
        }
        
        return filteredVehicles.sorted { v1, v2 in
            switch sortOption {
            case .name:
                return v1.owner.localizedCaseInsensitiveCompare(v2.owner) == .orderedAscending
            case .make:
                return v1.make.localizedCaseInsensitiveCompare(v2.make) == .orderedAscending
            case .licencePlate:
                return v1.licencePlate.localizedCaseInsensitiveCompare(v2.licencePlate) == .orderedAscending
            case .state_prov:
                return v1.state_Prov.localizedCaseInsensitiveCompare(v2.state_Prov) == .orderedAscending
            }
        }
        
    }
    var body: some View {
        NavigationStack {
            ScrollView{
                VStack{
                    ForEach(filteredAndSortedVehicles) { vehicle in
                        VStack(alignment: .leading) {
                            let text = orderedText(for: vehicle)
                            Text(text[0])
                                .font(.headline)
                            Text(text[1])
                                .font(.subheadline)
                            Text(text[2])
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                            Text(text[3])
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                        .id(vehicle.id)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.vertical, 5)
                        Divider()
                    }
                }
                .padding()
            }
            .scrollPosition($scrollPosition, anchor: .top)
            .onChange(of: sortOption) {
                withAnimation {
                    scrollPosition.scrollTo(edge: .top)
                }
            }
            .onChange(of: selectedIndex) {
                if let foundVehicle = filteredAndSortedVehicles.first(where: {vehicle in
                    switch sortOption {
                    case .name:
                        return vehicle.owner.hasPrefix(selectedIndex)
                    case .make:
                        return vehicle.make.hasPrefix(selectedIndex)
                    case .licencePlate:
                        return vehicle.licencePlate.hasPrefix(selectedIndex)
                    case .state_prov:
                        return vehicle.state_Prov.hasPrefix(selectedIndex)
                    }
                }) {
                    withAnimation {
                        scrollPosition.scrollTo(id: foundVehicle.id)
                    }
                }
            }
            .safeAreaInset(edge: .trailing) {
                IndexScrubberView(column: column, selectedIndex: $selectedIndex)
            }
            .searchable(text: $searchText, prompt: "Search by name, make, plate, or state/prov")
            .navigationTitle("Vehicles")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Menu {
                        Picker("Sort By", selection: $sortOption) {
                            ForEach(SortOption.allCases, id: \.self) { option in
                                Text(option.rawValue).tag(option)
                            }
                        }
                    } label: {
                        Label("Sort", systemImage: "arrow.up.arrow.down")
                    }

                }
            }
        }
    }
    
    func orderedText(for vehicle: Vehicle) -> [String] {
        let name = vehicle.owner
        let make = "\(vehicle.make) \(vehicle.model)"
        let plate = vehicle.licencePlate
        let state = vehicle.state_Prov
        
        switch sortOption {
        case .name:
            return [name, make, plate, state]
        case .make:
            return [make, name, plate, state]
        case .licencePlate:
            return [plate, name, make, state]
        case .state_prov:
            return [state, name, make, plate]
        }
    }
}
#Preview {
    VehicleListView()
}


struct IndexScrubberView: View {
    let column: [String]
    @Binding var selectedIndex: String
    @State private var contentHeight: CGFloat = 0
    var body: some View {
        VStack(spacing: 2) {
            ForEach(column, id: \.self) { char in
                Text(char)
                .font(.system(size: 12, weight: .light))
            }
        }
        .background(
            GeometryReader { geo in
                Color.clear
                    .onAppear {
                        contentHeight = geo.size.height
                    }
                    .onChange(of: geo.size.height) {
                        contentHeight = geo.size.height
                    }
            }
        )
        .padding(6)
        .background(.thinMaterial)
        .contentShape(Rectangle())
        .gesture(
            DragGesture(minimumDistance: 0)
                .onChanged{ value in
                    let itemHeight = contentHeight / CGFloat(column.count)
                    let index = Int(value.location.y / itemHeight)
                    let clampedIndex = max(0, min(column.count - 1, index))
                    let newIndex = column[clampedIndex]
                    if newIndex != selectedIndex {
                        selectedIndex = newIndex
                    }
                }
        )
    }
}
