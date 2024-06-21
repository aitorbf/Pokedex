//
//  DatabaseManager.swift
//  Pokedex
//
//  Created by Aitor Baragaño Fernández on 27/1/24.
//

import CoreData

protocol DatabaseManager {
    var container: NSPersistentContainer? { get }
}

final class DatabaseManagerDefault: DatabaseManager {
    
    var container: NSPersistentContainer?
    
    init() {
        initContainer()
    }
    
    private func initContainer() {
        container = NSPersistentContainer(name: "Pokedex")
        container?.loadPersistentStores { _, error in
            if error != nil {
                self.container = nil
            }
        }
        container?.viewContext.automaticallyMergesChangesFromParent = true
        container?.viewContext.name = "viewContext"
        container?.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        container?.viewContext.undoManager = nil
        container?.viewContext.shouldDeleteInaccessibleFaults = true
    }
}
