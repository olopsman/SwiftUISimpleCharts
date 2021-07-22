//
//  ChartModel.swift
//  SwiftUISimpleCharts
//
//  Created by Paulo Orquillo on 22/07/21.
//

import Foundation
import SwiftUI

struct ChartModel: Identifiable {
    var id = UUID()
    var day: String
    var values: CGFloat
    
    static var dummyData = [
        ChartModel(day: "Mon", values: 90),
        ChartModel(day: "Tue", values: 68),
        ChartModel(day: "Wed", values: 110),
        ChartModel(day: "Thu", values: 30),
        ChartModel(day: "Fri", values: 40),
        ChartModel(day: "Sat", values: 127),
        ChartModel(day: "Sun", values: 80)
    ]
}
