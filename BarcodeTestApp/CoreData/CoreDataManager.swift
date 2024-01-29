//
//  CoreDataManager.swift
//  BarcodeTestApp
//
//  Created by Наташа Яковчук on 28.01.2024.
//

import Foundation
import SwiftUI
import CoreData

class CoreDataManager: ObservableObject {
    
    static var shared = CoreDataManager()
    
    let persistentContainer: NSPersistentContainer
    
    private init() {
        persistentContainer = NSPersistentContainer(name: "ItemModel")
        persistentContainer.loadPersistentStores { description, error in
            guard error == nil else {print("Error of init CoreDataService: \(error!.localizedDescription)"); return}
        }
    }
    
    func updateEntity() {
        do {
            try persistentContainer.viewContext.save()
        } catch let error {
            persistentContainer.viewContext.rollback()
            print("Error updating CoreData entity: \(error.localizedDescription)")
        }
    }
    
    // edit the function according to your entity attributes
    func saveEntity(barcode: String, name: String, brand: String, addingDate: Date) {
        let entity = Item(context: persistentContainer.viewContext)
        entity.barcode = barcode
        entity.name = name
        entity.brand = brand
        entity.addingDate = addingDate
        
        do {
            try persistentContainer.viewContext.save()
            print("saved")
        } catch let error {
            persistentContainer.viewContext.rollback()
            print("Error saving CoreData entity: \(error.localizedDescription)")
        }
    }
    
    func deleteEntity(entity: Item) {
        persistentContainer.viewContext.delete(entity)
        updateEntity()
        print("entity deleted")
    }
    
    func allEntities() -> [Item] {
        let fetchRequest: NSFetchRequest<Item> = Item.fetchRequest()
        do {
            return try persistentContainer.viewContext.fetch(fetchRequest)
        } catch let error {
            print("Error getting all CoreData entities: \(error.localizedDescription)")
            return []
        }
    }
}

// for previews
extension Item {
    
    static var example: Item {
        
        // Get the first PlanPoint from the in-memory Core Data store
        let context = CoreDataManager.shared.persistentContainer.viewContext
        
        let fetchRequest: NSFetchRequest<Item> = Item.fetchRequest()
        fetchRequest.fetchLimit = 1
        
        let results = try? context.fetch(fetchRequest)
        
        return (results?.first!)!
    }
}


