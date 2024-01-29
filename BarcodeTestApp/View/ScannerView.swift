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
                } .overlay {
                    VStack {
                        ZStack{
                            Rectangle()
                                .frame(maxWidth: .infinity)
                                .frame(height: 200)
                                .ignoresSafeArea(edges: .all)
                                .foregroundStyle(.black.opacity(0.7))
                            
                            Button {
                                vm.showAddingView = false
                            } label: {
                                Image(systemName: "arrow.left")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 20)
                                    .padding()
                                    .background(Circle()
                                        .foregroundStyle(.white)
                                        .shadow(radius: 6))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding()
                                    
                            }
                        }
                        
                        Spacer()
                        
                        RoundedRectangle(cornerRadius: 35)
                            .stroke(lineWidth: 2)
                            .foregroundStyle(.orange)
                            .frame(width: 300, height: 100)
                            .shadow(radius: 3)
                            
                        
                        Spacer()
                        
                        ZStack {
                            Rectangle()
                                .frame(maxWidth: .infinity)
                                .frame(height: 200)
                                .ignoresSafeArea(edges: .all)
                                .foregroundStyle(.black.opacity(0.7))
                            
                            Text("Barcode has to be in the center")
                                .foregroundStyle(.white)
                                .fontWeight(.semibold)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 25)
                                    .foregroundStyle(.black.opacity(0.6)))
                        }

                    }.edgesIgnoringSafeArea(.all)
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
