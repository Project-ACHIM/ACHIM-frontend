//
//  InfoPicker.swift
//  ACHIM-frontend
//
//  Created by 2230220 on 2025/07/09.
//
import SwiftUI

struct InfoPicker: View {
    // 都道府県のリスト
       let prefectures = ["北海道", "青森県", "岩手県", "宮城県", "秋田県", "山形県", "福島県",
          "茨城県", "栃木県", "群馬県", "埼玉県", "千葉県", "東京都", "神奈川県",
          "新潟県", "富山県", "石川県", "福井県", "山梨県", "長野県", "岐阜県",
          "静岡県", "愛知県", "三重県", "滋賀県", "京都府", "大阪府", "兵庫県",
          "奈良県", "和歌山県", "鳥取県", "島根県", "岡山県", "広島県", "山口県",
          "徳島県", "香川県", "愛媛県", "高知県", "福岡県", "佐賀県", "長崎県",
          "熊本県", "大分県", "宮崎県", "鹿児島県", "沖縄県"]

       // 選択された都道府県を保持する変数
       @State private var selectedPrefecture = ""

       var body: some View {
           VStack(alignment: .leading, spacing: 4) {
               Text("都道府県")
                   .zenFont(.medium, size: 12, color: .defaultBlack)
               
               Picker("", selection: $selectedPrefecture) {
                   ForEach(prefectures, id: \.self) { prefectures in
                       Text(prefectures).tag(prefectures)
                   }
               } // 背景色を非表示にする
               .pickerStyle(.automatic)
               .frame(width: 200, height: 35)
               .accentColor(.defaultBlack) // 文字色
               // 角丸ボーダー
               .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.hexC6C6C6, lineWidth: 0.5)
               )

           }
       }
}

#Preview {
    InfoPicker()
}
