//
//  CoreDataStack.swift
//  Group Randomizer
//
//  Created by Christopher Thiebaut on 2/23/18.
//  Copyright © 2018 Christopher Thiebaut. All rights reserved.
//

import Foundation
import CoreData

enum CoreDataStack {
    static let container: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Group")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Failed to load from persistent store: \(error.localizedDescription), \(error.userInfo)")
            }
        })
        return container
    }()
    static let context = CoreDataStack.container.viewContext
}
