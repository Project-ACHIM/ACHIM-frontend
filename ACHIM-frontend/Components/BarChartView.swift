//
//  BarChartView.swift
//  ACHIM-frontend
//
//  Created by 上森拓翔 on 2025/07/14.
//
import SwiftUI
import Charts

struct StepData: Identifiable {
    let id = UUID()
    let day: String
    let steps: Int
}

struct BarChartView: View {
    let data: [StepData] = [
        StepData(day: "月", steps: 11000),
        StepData(day: "火", steps: 20000),
        StepData(day: "水", steps: 16000),
        StepData(day: "木", steps: 5000),
        StepData(day: "金", steps: 9000),
        StepData(day: "土", steps: 19000),
        StepData(day: "日", steps: 17000)
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("一週間の歩数")
                .zenFont(.bold, size: 12)
                .foregroundColor(.black)
                .padding(.bottom,10)
            
            Chart {
                ForEach(data) { item in
                    let style = item.steps > 10000 ? Color.blue.opacity(1.0) : Color.blue.opacity(0.5)
                    
                    BarMark(
                        x: PlottableValue.value("曜日", item.day),
                        y: PlottableValue.value("歩数", item.steps)
                    )
                    .foregroundStyle(style)
                    .cornerRadius(4)
                }
            }
            .frame(height: 200)
            .chartYScale(domain: 0...20000)
            .chartXAxis {
                AxisMarks()
            }
            .chartYAxis {
                AxisMarks(position: .leading) {
                    AxisGridLine()
                    AxisValueLabel()
                }
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(6)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(.hex5D9FED, lineWidth: 1)
        )
        .padding()
    }
}

#Preview {
    BarChartView()
}
