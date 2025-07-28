//
//  HealthDataRow.swift
//  ACHIM-frontend
//
//  Created by 上森拓翔 on 2025/07/28.
//
import SwiftUI

struct HealthDataRow: View {
    var icon: String
    var label: String
    var value: String
    var midUnit: String? = nil
    var value2: String? = nil
    var unit: String
    var valueColor: Color
    var color: Color
    
    var body: some View {
        HStack {
            HStack {
                Image(icon)
                    .frame(width: 60,height: 60)
                Text(label)
                    .zenFont(.bold, size: 15,color: valueColor)
            }
            .padding(.leading, 10)
            
            Spacer()
            
            HStack(alignment: .lastTextBaseline, spacing: 2) {
                Text(value)
                    .zenFont(.bold, size: 36,color: valueColor)
                
                if let mid = midUnit {
                    Text(mid)
                        .zenFont(.bold, size: 25,color: valueColor)
                }
                
                if let v2 = value2 {
                    Text(v2)
                        .zenFont(.bold, size: 36,color: valueColor)
                }
                
                Text(unit)
                    .zenFont(.bold, size: 25,color: valueColor)
            }
            .padding(.trailing, 10)
        }
        .frame(width: 360, height: 70)
        .background(color.opacity(0.2))
        .cornerRadius(10)
    }
}
