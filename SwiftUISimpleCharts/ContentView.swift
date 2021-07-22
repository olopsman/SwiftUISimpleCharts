//
//  ContentView.swift
//  SwiftUISimpleCharts
//
//  Created by Paulo Orquillo on 22/07/21.
//

import SwiftUI

struct ContentView: View {
    @State var selected = UUID()
    @State var colors = [Color("purple"), Color("blue")]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 25) {
            Text("Sample Charts")
                .font(.title)
                .bold()
                .foregroundColor(.white)
            
            HStack(spacing: 15){
                ForEach(ChartModel.dummyData) {chart in
                    VStack {
                        VStack {
                            Spacer(minLength: 0)
                            if selected == chart.id {
                                Text(getWorkoutMinutes(value: chart.values))
                                    .foregroundColor(Color("blue"))
                                    .padding(.bottom, 5)
                            }
                            
                            RoundedShape()
                                .fill(LinearGradient(gradient: Gradient(colors: selected == chart.id ? colors : colors.map {$0.opacity(0.2)}), startPoint: .top, endPoint: .bottom))
                                .frame(height: chart.values)
                            
                        }.frame(height: getMaxMinute())
                        .onTapGesture {
                            withAnimation {
                                selected = chart.id
                            }
                        }
                        
                        Text(chart.day)
                            .font(.caption)
                            .foregroundColor(.white)
                    }
                }
            }
        }
        .padding()
        .background(Color.white.opacity(0.08))
        .cornerRadius(10)
        .padding()
        .background(Color.black)
        .edgesIgnoringSafeArea(.all)
        .preferredColorScheme(.dark)
        .padding([.top, .bottom])
    }
    
    //helper functions
    private func getWorkoutMinutes(value: CGFloat) -> String {
        return String(format: "%.0f", value)
    }
    
    private  func getHeight(value: CGFloat) -> CGFloat {
        let height = (value /  1440) * 200
        return height
    }
    
    private func getMaxMinute() -> CGFloat {
        var maxMinute: CGFloat = 0.0
        for chart in ChartModel.dummyData {
            maxMinute = max(maxMinute, chart.values)
        }
        return maxMinute + maxMinute * 0.5
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
