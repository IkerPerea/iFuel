//
//  CustomGasMarker.swift
//  iFuel
//
//  Created by Iker Perea on 10/7/24.
//

import SwiftUI

struct CustomGasMarker: View {
        @State var station: GasStation
        @ObservedObject var viewModel: FuelViewModel
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .foregroundStyle(viewModel.getColorByPrice(precio: station.precioGasolina95E5))
                    .frame(width: 30, height: 30)
                    .padding(.bottom)
                Image(systemName: "triangle.fill")
                    .foregroundStyle(viewModel.getColorByPrice(precio: station.precioGasolina95E5))
                    .padding(.bottom, 18)
                    .rotationEffect(Angle(degrees: 180.0))
            }
            
                        Text(station.precioGasolina95E5)
                .bold()
        }
    }
}

