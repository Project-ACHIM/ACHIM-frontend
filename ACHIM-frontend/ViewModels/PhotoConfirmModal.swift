//
//  PhotoConfirmModal.swift
//  ACHIM-frontend
//
//  Created by 上森拓翔 on 2025/07/07.
//
import SwiftUI

struct PhotoConfirmModal: View {
    @ObservedObject var photoModel: PhotoPickerModel
    var onConfirm: () -> Void
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.4).ignoresSafeArea()
            PhotoConfirmView(viewModel: photoModel, onConfirm: onConfirm)
        }
        .zIndex(100)
    }
}
