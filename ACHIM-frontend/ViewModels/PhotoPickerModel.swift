//
//  PhotoPickerModel.swift
//  ACHIM-frontend
//
//  Created by 上森拓翔 on 2025/06/23.
//

import SwiftUI
import PhotosUI

class PhotoPickerModel: ObservableObject {
    @Published var image: UIImage?
    @Published var showModal = false          // 既存
    @Published var showingPicker = false      // ← 追加
    
    
    func reset() {
        image = nil
        showModal = false
    }
}
