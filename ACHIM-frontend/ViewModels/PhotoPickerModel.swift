//
//  PhotoPickerModel.swift
//  ACHIM-frontend
//
//  Created by 上森拓翔 on 2025/06/23.
//

import SwiftUI
import PhotosUI

class PhotoPickerModel: ObservableObject {
    @Published var image: UIImage? = nil
    @Published var showModal: Bool = false
    
    func reset() {
        image = nil
        showModal = false
    }
}
