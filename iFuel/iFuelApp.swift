//
//  iFuelApp.swift
//  iFuel
//
//  Created by Iker Perea on 10/7/24.
//

import SwiftUI

@main
struct iFuelApp: App {
    @ObservedObject var viewModel = FuelViewModel()
    var body: some Scene {
        WindowGroup {
            MapView(viewModel: viewModel)
        }
    }
}
