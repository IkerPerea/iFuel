//
//  FuelNavigation.swift
//  iFuel
//
//  Created by Iker Perea on 10/7/24.
//

import Foundation
import SwiftUI

class FuelFactory {
    static func setViewForDestination(_ destination: FuelNavigation) -> AnyView {
        switch destination {
        case .gasStationDetails:
            return AnyView(DetailedView())
        }
    }
}
