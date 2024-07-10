//
//  FuelNavigation.swift
//  iFuel
//
//  Created by Iker Perea on 10/7/24.
//

import Foundation
import SwiftUI
class FuelFlow: ObservableObject {
    static let shared = FuelFlow()
    @Published var path = NavigationPath()
    @Published var selectedGasStation: GasStation?
    func clear() {
        path = .init()
    }
    func navigateBack() {
        path.removeLast(path.count)
    }
    func backToPrevious() {
        path.removeLast()
    }
    func navigateToDetailedView() {
        path.append(FuelNavigation.gasStationDetails)
    }
    func done() {
        path = .init()
    }
}
