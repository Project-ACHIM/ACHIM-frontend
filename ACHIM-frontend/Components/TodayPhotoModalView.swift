//
//  TodayPhotoModalView.swift
//  ACHIM-frontend
//
//  Created by 上森拓翔 on 2025/07/07.
//

import SwiftUI

struct TodayPhotoModalView: View {
    var onClose: () -> Void
//    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.4).ignoresSafeArea()
            
            VStack(spacing: 16) {
                VStack(spacing: 12) {
                    // タイトル部分
                    Text("イベント")
                        .zenFont(.bold, size: 20,color: .hex347CD1)
                        .foregroundColor(.blue)
                    
                    Text("本日の一枚")
                        .zenFont(.bold, size: 36, color: .hex6CB0FF)
                        .foregroundColor(Color("BaseSky")) // .baseSky に相当
                    
                }
                VStack{
                    // イラスト
                    Image(.photoMock) // ← アセットに画像を追加してください
                        .resizable()
                        .scaledToFit()
                        .frame(width:300,height: 180)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                    // 本文
                    Text("朝活の瞬間を共有し、チームメンバーと”自分の朝”をシェアする写真イベントです。朝景色や朝活達成の瞬間をその場で1枚投稿。誰にも負けない写真を撮ろう！")
                        .zenFont(.regular, size: 12,color: .hex505050)
                        .multilineTextAlignment(.leading)
                        .fixedSize(horizontal: false, vertical: true)
                        .lineLimit(nil)
                        .frame(width: 280)
                }
                VStack{
                    Text("投稿は1日1枚のみ。削除・差し替え不可。\nリアクション最多でMorning MVP賞とSP付与")
                        .zenFont(.regular, size: 10,color: .gray)
                        .fixedSize(horizontal: false, vertical: true)
                        .lineLimit(nil)
                        .multilineTextAlignment(.center)
                        .padding(.vertical,26)
                }
                
                // 閉じるボタン
                Button(action: {
                    onClose()
//                    dismiss()
                }) {
                    Text("閉じる")
                        .zenFont(.bold, size: 16,color: .white)
                        .frame(width: 180,height: 40)
                        .background(.hex6CB0FF)
                        .cornerRadius(10)
                        
                }
            }
            .padding(.vertical, 20)
            .padding(.horizontal, 24)
            .background(Color.white)
            .cornerRadius(20)
            .frame(width: 350,height: 500)
        }
    }
}

//#Preview{
//    TodayPhotoModalView()
//}
