//
//  dataPicker.swift
//  ACHIM-frontend
//
//  Created by 2230220 on 2025/07/10.
//
import SwiftUI

struct dataPicker: View {
    // 都道府県のリスト
    let prefectures = [5,6,7,8,9]
    
    // 選択された都道府県を保持する変数
    @State private var selectedData: Int = 0
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("起床時間")
                .zenFont(.medium, size: 12, color: .defaultBlack)
            
            Picker("", selection: $selectedData) {
                ForEach(prefectures, id: \.self) { prefectures in
                    Text("\(prefectures)時").tag(prefectures)
                        .zenFont(.bold, size: 10, color: .defaultBlack)
                }
            } // 背景色を非表示にする
            .zenFont(.bold, size: 10, color: .defaultBlack)
            .pickerStyle(.automatic)
            .frame(width: 150, height: 35)
            .accentColor(.defaultBlack) // 文字色
            .background(Color.white) // 背景色
            .cornerRadius(5) // 角丸
            // 角丸ボーダー
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.hexC6C6C6, lineWidth: 0.5)
            )
            .onChange(of: selectedData) { newValue in
                print("\(newValue)")
            }
            
        }
    }
}

#Preview {
    dataPicker()
}
