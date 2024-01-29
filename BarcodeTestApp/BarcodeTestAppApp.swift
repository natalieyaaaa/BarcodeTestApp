//
//  BarcodeTestAppApp.swift
//  BarcodeTestApp
//
//  Created by Наташа Яковчук on 25.01.2024.
//

import SwiftUI

@main
struct BarcodeTestAppApp: App {
    var body: some Scene {
        WindowGroup {
            MainView()
                .preferredColorScheme(.light)
                .onTapGesture {
                    hideKeyboard()
                }
                
        }
    }
}
func hideKeyboard() {
    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
}
