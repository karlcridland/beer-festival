//
//  ProfileView.swift
//  Beer Festival
//
//  Created by Karl Cridland on 11/09/2025.
//

import SwiftUI

struct ProfileView: View {
    
    @ObservedObject var viewModel: ProfileViewModel
    
    init() {
        _viewModel = ObservedObject(initialValue: ProfileViewModel())
    }
    
    var body: some View {
        Text("ProfileView")
    }
    
}
