//
//  StampsView.swift
//  Beer Festival
//
//  Created by Karl Cridland on 10/09/2025.
//

import SwiftUI

struct StampsView: View {
    
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: StampsViewModel
    
    let onRefresh: () -> Void
    
    init(festival: Festival, onRefresh: @escaping () -> Void) {
        _viewModel = ObservedObject(initialValue: StampsViewModel(festival: festival))
        self.onRefresh = onRefresh
    }
    
    var body: some View {
        Button {
            DispatchQueue.main.async {
                viewModel.festival.stamps.add(5)
                dismiss()
                onRefresh()
            }
        } label: {
            Text("Add 5 stamps")
        }
    }
    
}
