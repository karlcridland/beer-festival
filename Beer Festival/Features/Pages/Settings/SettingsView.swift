//
//  PaymentView.swift
//  Beer Festival
//
//  Created by Karl Cridland on 11/09/2025.
//

import SwiftUI

struct SettingsView: View {
    
    @ObservedObject var viewModel: SettingsViewModel
    
    init() {
        _viewModel = ObservedObject(initialValue: SettingsViewModel())
    }
    
    var body: some View {
        Text("SettingsView")
    }
    
}
