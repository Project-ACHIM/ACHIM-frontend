//
//  ActivityButtonView.swift
//  ACHIM-frontend
//
//  Created by 上森拓翔 on 2025/06/16.
//

import SwiftUI

struct ActivityButtonView: View {
    let label: String
    
    init(label: String = "朝活を始める") {
        self.label = label
    }
    
    var body: some View {
        Button(action: {
            // 必要に応じてアクションを追加
        }) {
            Text(label)
                .zenFont(.medium, size: 16, color: .white)
                .frame(minWidth: 120, minHeight: 40)
//                .padding(.horizontal, )
                .background(Color("hex6CB0FF"))
                .cornerRadius(10)
        }
    }
}

#Preview{
    ActivityButtonView()
}
