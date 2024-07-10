//
//  ContentView.swift
//  iFuel
//
//  Created by Iker Perea on 10/7/24.
//

import SwiftUI
import MapKit
struct MapView: View {
    @ObservedObject var viewModel: FuelViewModel
    @EnvironmentObject var fuelFlow: FuelFlow
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 40.4168, longitude: -3.7038), // Center of Spain
        span: MKCoordinateSpan(latitudeDelta: 5.0, longitudeDelta: 5.0)
    )
    
    var body: some View {
        NavigationStack(path: $fuelFlow.path) {
            Map(coordinateRegion: $region, annotationItems: viewModel.gasStationList) { gasStation in
                MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: Double(gasStation.latitud) ?? 0.0, longitude: Double(gasStation.longitud) ?? 0.0)) {
                    CustomGasMarker(station: gasStation, viewModel: viewModel)
                        .onTapGesture {
                            fuelFlow.selectedGasStation = gasStation
                            fuelFlow.navigateToDetailedView()
                        }
                }
            }
            .mapStyle(.standard)
            .onAppear {
                viewModel.onAppear()
            }
        }
        .navigationDestination(for: FuelNavigation.self) { destination in
            FuelFactory.setViewForDestination(destination)
        }
    }
}


#Preview {
    ContentView(viewModel: FuelViewModel())
}
