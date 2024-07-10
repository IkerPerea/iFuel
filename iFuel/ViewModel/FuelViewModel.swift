//
//  FuelViewModel.swift
//  iFuel
//
//  Created by Iker Perea on 10/7/24.
//

import SwiftUI

class FuelViewModel: ObservableObject {
    @Published var gasStationList: [GasStation] = []
    func onAppear() {
        decodeGasInfo()
    }
    func decodeGasInfo() {
            guard let path = Bundle.main.path(forResource: "misco", ofType: "json") else {
                fatalError("No JSON file")
            }
            let gasStations = try! JSONDecoder().decode([GasStation].self, from: Data(contentsOf: URL(fileURLWithPath: path)))
        gasStationList = gasStations
    }
    func getColorByPrice(precio: String) -> Color {
        let price = Double(precio) ?? 0
        if price > 1.85 {
            return .black
        } else if price > 1.70 {
            return .red
        } else if price > 1.50 {
            return .orange
        } else if price > 1.30 {
            return .green
        } else if price > 1.10 {
            return .blue
        } else {
            return .gray
        }
    }
}
