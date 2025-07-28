//
//  HealthView.swift
//  ACHIM-frontend
//
//  Created by 2230220 on 2025/07/07.
//

import SwiftUI

struct HealthView: View {
    private var todayDateString: String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ja_JP")
        formatter.dateFormat = "M月d日"
        return formatter.string(from: Date())
    }
    
    @State private var selectedCategory: Category = .steps
    enum Category: String, CaseIterable {
        case steps = "歩数"
        case distance = "距離"
        case sleep = "睡眠"
    }
    
    var body: some View {
        VStack(spacing: 16) {
            Color.white.ignoresSafeArea()

            // 日付表示
            HStack(alignment: .center) {
                Image(systemName: "chevron.left")
                    .frame(width: 14, height: 14)
                    .padding(.horizontal,10)
                Spacer()
                Text(todayDateString)
                    .zenFont(.bold, size: 18, color: .white)
                Spacer()
                Image(systemName: "chevron.right")
                    .frame(width: 14, height: 14)
                    .padding(.trailing,10)
            }
            .frame(width: 360, height: 35)
            .background(.hex6CB0FF)
            .foregroundColor(.white)
            .cornerRadius(6)
            
            
            // 今日のデータ
            VStack(spacing: 12) {
                HealthDataRow(
                    icon: "steps-icon",
                    label: "歩数",
                    value: "15,000",
                    unit: "歩",
                    valueColor: Color(hex: "A46800"),
                    color: .orange
                )
                HealthDataRow(
                    icon: "distance-icon",
                    label: "距離",
                    value: "10",
                    unit: "km",
                    valueColor: Color(hex: "007D1A"),
                    color: .green
                )
                HealthDataRow(
                    icon: "sleep-icon",
                    label: "睡眠時間",
                    value: "6",
                    midUnit: "h",
                    value2: "30",
                    unit: "m",
                    valueColor: Color(hex: "0051AA"),
                    color: .blue
                )
            }
            .padding(.horizontal)
            
            Divider()
            
            // 一週間で見る
            VStack(alignment: .leading, spacing: 8) {
                Text("一週間で見る")
                    .zenFont(.bold, size: 20, color: .defaultBlack)
                    .padding(.horizontal)
                
                HStack(spacing: 0) {
                    ForEach(Category.allCases, id: \.self) { category in
                        Button(action: {
                            selectedCategory = category
                        }) {
                            Text(category.rawValue)
                                .zenFont(.bold, size: 12, color: selectedCategory == category ? .white : .white)
                                .frame(maxWidth: .infinity)
                                .frame(height: 35)
                                .background(selectedCategory == category ?  Color.hex7AB7FF : Color.hex6CB0FF)
                        }
                    }
                }
                .frame(width: 360, height: 35)
                .zenFont(.bold, size: 12, color: .white)
                .background(.hex6CB0FF)
                .cornerRadius(6)
                .padding(.horizontal)
                
                BarChartView()
            }
        }
        .background(Color.white)
    }
}


extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        let scanner = Scanner(string: hex)
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        let r = Double((rgb >> 16) & 0xFF) / 255.0
        let g = Double((rgb >> 8) & 0xFF) / 255.0
        let b = Double(rgb & 0xFF) / 255.0
        self.init(red: r, green: g, blue: b)
    }
}

#Preview {
    HealthView()
}
