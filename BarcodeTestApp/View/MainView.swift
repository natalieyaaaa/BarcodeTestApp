//
//  MainView.swift
//  BarcodeTestApp
//
//  Created by Наташа Яковчук on 28.01.2024.
//

import SwiftUI
import AVFoundation

struct MainView: View {
    
    @StateObject var vm = MainViewModel()
    
    var body: some View {
            VStack {
                
                if vm.allItems.isEmpty {
                    Text("Tap 📷 to start adding items")
                    
                } else {
                    
                    Text("All items:")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    ScrollView {
                        ForEach(vm.allItems, id: \.self) { item in
                            ItemView(item: item)
                        }
                    }
                }
                
                Button {
//                    requestCameraPermission()
//                    checkCameraPermission()
                    vm.showAddingView = true

                } label: {
                    Text("📷")
                        .font(.system(size: 40))
                        .padding()
                        .background(Circle()
                            .foregroundColor(.white)
                            .shadow(radius: 4))
                }
                
            }.onAppear {vm.getData()}
                .fullScreenCover(isPresented: $vm.showAddingView, content: {
                    ScannerView()
                        .environmentObject(vm)
                })
        }
    
//    func checkCameraPermission() {
//           switch AVCaptureDevice.authorizationStatus(for: .video) {
//           case .authorized:
//               isCameraAuthorized = true
//           case .notDetermined:
//               requestCameraPermission()
//           default:
//               isCameraAuthorized = false
//           }
//       }
//
//       func requestCameraPermission() {
//           AVCaptureDevice.requestAccess(for: .video) { granted in
//               DispatchQueue.main.async {
//                   isCameraAuthorized = granted
//               }
//           }
//       }

    }

#Preview {
    MainView()
}

