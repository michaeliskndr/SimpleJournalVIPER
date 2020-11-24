//
//  CoreDataManager.swift
//  SimpleJournalVIPER
//
//  Created by Michael Iskandar on 23/11/20.
//  Copyright © 2020 Michael Iskandar. All rights reserved.
//

import CoreData

class CoreDataManager {
    
    static let shared = CoreDataManager()
    
    lazy var container: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "JournalApp")
        container.loadPersistentStores { (_, error) in
            container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy

            if let error = error {
                print("Error happens: \(error)")
            }
            
        }
        return container
    }()
    
    var moc: NSManagedObjectContext {
        return container.viewContext
    }

    func saveContext() {
        if moc.hasChanges {
            do {
                try moc.save()
            } catch {
                print("Error happens: \(error)")
            }
        }
    }
    
    func getAll<T: NSManagedObject>() -> [T] {
        do {
            let request = NSFetchRequest<T>(entityName: "\(T.self)")
            let items = try moc.fetch(request) 
            return items
        } catch {
            print("Error while fetching coreData")
            return []
        }
    }
    
    func getItem<T: NSManagedObject>(at id: NSManagedObjectID) -> T? {
        do {
            return try moc.existingObject(with: id) as? T
        } catch {
            print("Error while fetch data from coreData with \(id)")
        }
        return nil
    }
    
    func deleteItem(at id: NSManagedObjectID) {
        do {
            let item = try moc.existingObject(with: id)
            moc.delete(item)
        } catch let fetchItemError {
            print("Error while fetch data from coreData with \(id): \(fetchItemError)")
        }
    }
    
}
