//
//  ObjectView.swift
//  BarcodeTestApp
//
//  Created by Наташа Яковчук on 28.01.2024.
//

import SwiftUI

struct ItemView: View {
    
    @EnvironmentObject var vm: MainViewModel
    
    var item: Item
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Group {
                
                Text("Barcode: \(item.barcode!)")
                Text("Name: \(item.name!)")
                Text("Brand: \(item.brand!)")
                Text("Adding date: \(item.addingDate!.formatted())")
                
            }.fontWeight(.semibold)
                .foregroundStyle(.blue)
            
        } .padding()
            .background(RoundedRectangle(cornerRadius: 30)
                .foregroundStyle(.blue.opacity(0.2)))
    }
}

#Preview {
    ItemView(item: Item.example)
        .environmentObject(MainViewModel())
}
