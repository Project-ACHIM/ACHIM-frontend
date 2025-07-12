//
//  FormBg.swift
//  ACHIM-frontend
//
//  Created by 2230220 on 2025/07/09.
//
import SwiftUI

struct FormBg: View {
    var body: some View {
        //背景
        RoundedRectangle(cornerRadius: 35)
            .fill(Color.baseSky)
            .frame(width: .infinity, height: 650)
    }
    
}
