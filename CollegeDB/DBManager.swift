//
//  DBManager.swift
//  CollegeDB
//
//  Created by apple on 07/06/19.
//  Copyright © 2019 iOSProofs. All rights reserved.
//

import UIKit
import CoreData

class DBManager {
    static let sharedManager = DBManager()
    lazy var context = persistentContainer.viewContext
    
    private init () { }
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "CollegeDB")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    func saveContext () {
        if context.hasChanges {
            do {
                try context.save()
            } catch {                
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func updateData() {
        
    }
    
    func deleteData() {
        
    }
    
    func getColleges(entity: NSManagedObject.Type) -> [NSManagedObject]? {
        let entityName = String(describing: entity)
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        do {
            if let colleges = try context.fetch(fetchRequest) as? [NSManagedObject] {
                return colleges
            }
        } catch {
            print("Error occurred during fetch!")
            return nil
        }
        return []
    }
    
}
