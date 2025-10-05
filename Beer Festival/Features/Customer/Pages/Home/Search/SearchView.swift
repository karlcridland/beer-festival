//
//  FilterView.swift
//  Beer Festival
//
//  Created by Karl Cridland on 30/09/2025.
//

import SwiftUI

struct SearchView: View {
    
    @ObservedObject var viewModel: SearchViewModel
    
    init() {
        _viewModel = ObservedObject(initialValue: SearchViewModel())
    }
    
    var body: some View {
        
    }
    
}
