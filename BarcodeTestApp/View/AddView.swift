//
//  AddView.swift
//  BarcodeTestApp
//
//  Created by Наташа Яковчук on 28.01.2024.
//

import SwiftUI

struct AddView: View {
    
    @EnvironmentObject var vm: MainViewModel
    
    var scannedCode: String
    
    var body: some View {
            VStack(spacing: 20) {
                
                Text("Barcode: \(scannedCode)")
                    .foregroundStyle(.blue)
                    .bold()
                    .padding(12)
                    .background(RoundedRectangle(cornerRadius: 30)
                        .foregroundStyle(.blue.opacity(0.3)))
                
                Group {
                    TextField("Print in the name...", text: $vm.name)
                    
                    TextField("Print in the brand..(optional)", text: $vm.brand)
                    
                }.textFieldStyle(.roundedBorder)
                    .frame(width: 300)
                
                Text("Choose adding date and time ⬇️")
                    .fontWeight(.semibold)
                    .padding(.top)
                
                DatePicker("", selection: $vm.addingDate)
                    .padding(.trailing, 100)
                    .datePickerStyle(.compact)
                
                
                Button {
                    vm.addItem()
                    vm.showAddingView = false
                } label: {
                        Text("Add item")
                            .bold()
                            .foregroundStyle(.green)
                            .padding(12)
                            .background(RoundedRectangle(cornerRadius: 30)
                                .foregroundStyle(.green.opacity(0.3)))
                } 
                .padding(.top, 50)
            }/*.onAppear {vm.barcode = scannedCode}*/
            
                .alert(isPresented: $vm.showAlert, content: {
                    Alert(title:
                            Text("This item is already added"))
                })
        }
}

#Preview {
    AddView(scannedCode: "4645648")
        .environmentObject(MainViewModel())
}
