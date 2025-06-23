//
//  PhotoView.swift
//  ACHIM-frontend
//
//  Created by 上森拓翔 on 2025/06/23.
//

import SwiftUI
import PhotosUI

struct PhotoView: View {
    @StateObject private var viewModel = PhotoPickerModel()
    @State private var selectedItem: PhotosPickerItem? = nil
    
    var body: some View {
        ZStack {
            VStack {
                PhotosPicker(
                    selection: $selectedItem,
                    matching: .images,
                    photoLibrary: .shared()
                ) {
                    ActivityButtonView(label: "写真を選ぶ", asLabelOnly: true)
                }
            }
            
            if viewModel.showModal {
                Color.black.opacity(0.4).ignoresSafeArea()
                PhotoConfirmView(viewModel: viewModel) {
                    print("Confirmed!")
                }
            }
        }
        .onChange(of: selectedItem) { newItem in
            if let item = newItem {
                Task {
                    if let data = try? await item.loadTransferable(type: Data.self),
                       let uiImage = UIImage(data: data) {
                        viewModel.image = uiImage
                        viewModel.showModal = true
                    }
                }
            }
        }
    }
}

#Preview {
    PhotoView()
}
