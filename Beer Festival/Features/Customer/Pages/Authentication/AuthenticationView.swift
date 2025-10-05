//
//  AuthenticationView.swift
//  Beer Festival
//
//  Created by Karl Cridland on 29/09/2025.
//

import SwiftUI
import _AuthenticationServices_SwiftUI

struct AuthenticationView: View {
    
    @ObservedObject var viewModel: AuthenticationViewModel
    @Environment(\.openURL) private var openURL
    
    init() {
        _viewModel = ObservedObject(initialValue: AuthenticationViewModel())
    }
    
    
    
    var body: some View {
        NavigationStack {
            ScrollView {
                Spacer()
                VStack {
                    
                    Text("Click sign in with Apple to continue, if you don't have an account this will create one for you.")
                        .font(.caption)
                        .padding(10)
                        .frame(maxWidth: 360)
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .navigationTitle("Sign in")
            .toolbarTitleDisplayMode(.inlineLarge)
            .background(.backgroundYellow)
            .toolbar {
                if #available(iOS 26.0, *) {
                    ToolbarItem(placement: .bottomBar) {
                        SignInWithAppleButton(.signIn, onRequest: viewModel.configure, onCompletion: viewModel.handle)
                            .signInWithAppleButtonStyle(.black)
                            .frame(height: 50)
                            .padding(.horizontal)
                    }
                    .sharedBackgroundVisibility(.hidden)
                } else {
                    ToolbarItem(placement: .bottomBar) {
                        SignInWithAppleButton(.signIn, onRequest: viewModel.configure, onCompletion: viewModel.handle)
                            .signInWithAppleButtonStyle(.black)
                            .frame(height: 50)
                            .padding(.horizontal)
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Menu {
                        Button("Privacy Policy", systemImage: "hand.raised") {
                            if let url = URL(string: "https://www.google.com") {
                                openURL(url)
                            }
                        }
                        Button("Contact Support", systemImage: "envelope") {
                            if let url = URL(string: "mailto:support@example.com") {
                                openURL(url)
                            }
                        }
                    } label: {
                        Label("Options", systemImage: "ellipsis")
                    }
                }
            }
        }
    }
    
}


#Preview {
    AuthenticationView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}

extension Button where Label == Text {
    init(url: String, label: String) {
        self.init(action: {
            if let link = URL(string: url) {
                #if os(iOS)
                UIApplication.shared.open(link)
                #elseif os(macOS)
                NSWorkspace.shared.open(link)
                #endif
            }
        }, label: {
            Text(label)
        })
    }
}
