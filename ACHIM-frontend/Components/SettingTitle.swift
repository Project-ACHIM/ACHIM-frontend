//
//  SettingTitle.swift
//  ACHIM-frontend
//
//  Created by 2230220 on 2025/08/18.
//
import SwiftUI

struct SettingTitle: View {
    @State var isTitle: String
    var body: some View {
        Text(isTitle)
             .zenFont(.regular, size: 12)
             .padding(.leading, 16)
             .padding(.trailing, 16)
             .background(Color.hexFFDE7D)
             .cornerRadius(10)

    }
}

#Preview {
    SettingTitle(isTitle: "Get Ready With Achim賞")
}
