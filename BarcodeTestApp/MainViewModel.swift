//
//  MainViewModel.swift
//  BarcodeTestApp
//
//  Created by Наташа Яковчук on 28.01.2024.
//

import Foundation

final class MainViewModel: ObservableObject {
    
    @Published var allItems = [Item]()
    
    @Published var barcode = ""
    @Published var name = ""
    @Published var brand = ""
    @Published var addingDate = Date()
    
    @Published var showAlert = false
    @Published var showAddingView = false
    
    var coreData = CoreDataManager.shared
    
    init() {
        getData()
    }
    
    func getData() {
        allItems = coreData.allEntities()
    }
    
    func addItem() {
        guard !allItems.contains(where: {$0.barcode == barcode}) else {print("exists"); showAlert = true; return}
        guard name != "" && barcode != "" else {print("no name"); return}

        coreData.saveEntity(barcode: barcode, name: name, brand: brand , addingDate: addingDate)
        print("ok")
        
        showAddingView = false
        barcode = ""
        name = ""
        brand = ""
    }
}
