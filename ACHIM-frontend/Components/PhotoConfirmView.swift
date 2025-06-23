//
//  PhotoConfirmView.swift
//  ACHIM-frontend
//
//  Created by 上森拓翔 on 2025/06/23.
//

import SwiftUI

struct PhotoConfirmView: View {
    @ObservedObject var viewModel: PhotoPickerModel
    var onConfirm: () -> Void
    
    var body: some View {
        VStack(spacing: 16) {
            Text("この写真でいいですか？")
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(Color("hex6CB0FF"))
            
            Text("あなたの名前が公開されることはありません")
                .font(.system(size: 12))
                .foregroundColor(.gray)
            
            if let image = viewModel.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width:250,height: 350)
                    .cornerRadius(16)
                    .padding(.vertical, 4)
            } else {
                Rectangle()
                    .fill(Color.blue.opacity(0.1))
                    .frame(width:250,height: 350)
                    .cornerRadius(16)
            }
            
            HStack(spacing: 20) {
                Button("やり直す") {
                    viewModel.reset()
                }
                .frame(width: 100, height: 40)
                .background(Color("hex6CB0FF").opacity(0.5))
                .foregroundColor(.white)
                .cornerRadius(10)
                
                Button("確定") {
                    onConfirm()
                    viewModel.showModal = false
                }
                .frame(width: 100, height: 40)
                .background(Color("hex6CB0FF"))
                .foregroundColor(.white)
                .cornerRadius(10)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(20)
        .padding()
    }
}

#Preview {
    let model = PhotoPickerModel()
    model.image = UIImage(systemName: "photo") // 仮の画像（SF Symbols）
    model.showModal = true
    
    return PhotoConfirmView(viewModel: model) {
        print("Confirmed!")
    }
}
