//
//  StampsView.swift
//  Beer Festival
//
//  Created by Karl Cridland on 10/09/2025.
//

import SwiftUI

struct StampsView: View {
    
    @ObservedObject var viewModel: StampsViewModel
    
    init(festival: Festival) {
        _viewModel = ObservedObject(initialValue: StampsViewModel())
    }
    
    var body: some View {
        Text("StampsView")
    }
    
}
