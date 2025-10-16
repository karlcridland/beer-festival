//
//  FestivalGalleryView.swift
//  Beer Festival
//
//  Created by Karl Cridland on 07/10/2025.
//

import SwiftUI

struct FestivalGalleryView: View {
    
    @ObservedObject var viewModel: FestivalGalleryViewModel
    
    init(festival: Festival) {
        _viewModel = ObservedObject(initialValue: FestivalGalleryViewModel(festival: festival))
    }
    
    var body: some View {
        Text("Gallery")
    }
}
