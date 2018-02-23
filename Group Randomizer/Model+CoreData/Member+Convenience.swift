//
//  Member+Convenience.swift
//  Group Randomizer
//
//  Created by Christopher Thiebaut on 2/23/18.
//  Copyright © 2018 Christopher Thiebaut. All rights reserved.
//

import Foundation
import CoreData

extension Member {
    
    convenience init(name: String, context: NSManagedObjectContext = CoreDataStack.context){
        self.init(context: context)
        self.name = name
    }
    
}
