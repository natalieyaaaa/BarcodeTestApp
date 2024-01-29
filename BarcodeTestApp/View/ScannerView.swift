//
//  ContentView.swift
//  BarcodeTestApp
//
//  Created by Наташа Яковчук on 25.01.2024.
//

import SwiftUI

struct ScannerView: View {
    
    @State private var scannedCode: String?
    
    @EnvironmentObject var vm: MainViewModel

    var body: some View {
        VStack {
            if let scannedCode = scannedCode {
                AddView(scannedCode: scannedCode)
                    .environmentObject(vm)
            } else {
                BarcodeScannerView { code in
                    self.scannedCode = code
                }
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ScannerView()
            .environmentObject(MainViewModel())
    }
}
