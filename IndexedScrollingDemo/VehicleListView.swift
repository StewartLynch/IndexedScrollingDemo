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

struct VehicleListView: View {
    let vehicles = Vehicle.mockData
    var body: some View {
        NavigationStack {
            List(vehicles) { vehicle in
                VStack(alignment: .leading) {
                    Text(vehicle.owner)
                        .font(.headline)
                    Text("\(vehicle.make) \(vehicle.model)")
                        .font(.subheadline)
                    Text(vehicle.licencePlate)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                    Text(vehicle.state_Prov)
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            }
            .listStyle(.plain)
            .navigationTitle("Vehicles")
        }
    }
}
#Preview {
    VehicleListView()
}
