//
//  HomeActionSection.swift
//  ACHIM-frontend
//
//  Created by 上森拓翔 on 2025/07/07.
//

import SwiftUI
import PhotosUI

struct HomeActionSection: View {
    @Binding var startedMorningActivity: Bool
    @Binding var photoPosted: Bool
    @Binding var selectedPhoto: UIImage?
    @Binding var selectedItem: PhotosPickerItem?
    @Binding var isShowingVoting: Bool
    @Binding var isAfter6PM: Bool
    @Binding var didFinishMorningActivity: Bool
    @Binding var myStatusSymbol: String
    
    var body: some View {
        if !startedMorningActivity {
            ActivityButtonView(label: "朝活を始める") {
                startedMorningActivity = true
            }
            .disabled(true) // 残り秒数は外から管理（バインドして渡してもよい）
            .opacity(0.5)
            .padding(.bottom, 35)
            
        } else {
            HStack(spacing: 12) {
                if !photoPosted {
                    PhotosPicker(selection: $selectedItem, matching: .images, photoLibrary: .shared()) {
                        ActivityButtonView(label: "写真投稿", asLabelOnly: true)
                    }
                } else {
                    if isAfter6PM {
                        ActivityButtonView(label: "投票結果") {
                            print("投票結果ボタン")
                        }
                    } else {
                        ActivityButtonView(label: "投票") {
                            guard selectedPhoto != nil else { return }
                            isShowingVoting = true
                        }
                    }
                }
                
                ActivityButtonView(label: "本日の朝活終了", isPrimary: true, backgroundColor: Color.yellow) {
                    startedMorningActivity = false
                    photoPosted = false
                    selectedPhoto = nil
                    selectedItem = nil
                    didFinishMorningActivity = true
                    myStatusSymbol = "－"
                }
            }
            .padding(.bottom, 35)
        }
    }
}
