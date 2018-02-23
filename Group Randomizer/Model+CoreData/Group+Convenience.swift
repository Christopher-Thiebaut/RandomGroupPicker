//
//  Group+Convenience.swift
//  Group Randomizer
//
//  Created by Christopher Thiebaut on 2/23/18.
//  Copyright © 2018 Christopher Thiebaut. All rights reserved.
//

import Foundation
import CoreData

extension Group {
    
    convenience init(members: NSOrderedSet = NSOrderedSet(), context: NSManagedObjectContext = CoreDataStack.context){
        self.init(context: context)
        self.members = members
    }
    
}
