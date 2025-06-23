//
//  ActivityButtonView.swift
//  ACHIM-frontend
//
//  Created by 上森拓翔 on 2025/06/16.
//

import SwiftUI

struct NoHighlightButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .opacity(1.0) // ハイライト色を消す
            .scaleEffect(configuration.isPressed ? 1.05 : 1.0)
            .animation(.spring(response: 0.3, dampingFraction: 0.5), value: configuration.isPressed)
    }
}

struct ActivityButtonView: View {
    let label: String
    let action: () -> Void
    var isPrimary: Bool = true
    var width: CGFloat = 120
    var height: CGFloat = 40
    var asLabelOnly: Bool = false
    
    @State private var isPressed = false
    
    init(
        label: String = "朝活を始める",
        isPrimary: Bool = true,
        width: CGFloat = 120,
        height: CGFloat = 40,
        asLabelOnly: Bool = false,
        action: @escaping () -> Void = {}
    ) {
        self.label = label
        self.isPrimary = isPrimary
        self.width = width
        self.height = height
        self.asLabelOnly = asLabelOnly
        self.action = action
    }
    
    var body: some View {
        Group {
            if asLabelOnly {
                // ボタンを使わないラベル表示専用モード
                Text(label)
                    .zenFont(.medium, size: 16, color: .white)
                    .frame(width: width, height: height)
                    .background(isPrimary ? Color("hex6CB0FF") : Color("hex6CB0FF").opacity(0.5))
                    .cornerRadius(10)
            } else {
                // 通常のボタンモード
                Button(action: {
                    withAnimation(.spring()) {
                        isPressed = true
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                        isPressed = false
                        action()
                    }
                }) {
                    Text(label)
                        .zenFont(.medium, size: 16, color: .white)
                        .frame(width: width, height: height)
                        .background(isPrimary ? Color("hex6CB0FF") : Color("hex6CB0FF").opacity(0.5))
                        .cornerRadius(10)
                }
                .buttonStyle(NoHighlightButtonStyle())
                .buttonStyle(PlainButtonStyle())
                .scaleEffect(isPressed ? 1.02 : 1.0)
                .animation(.spring(response: 0.3, dampingFraction: 0.5), value: isPressed)
            }
        }
    }
}
