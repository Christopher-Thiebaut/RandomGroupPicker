//
//  Member+CoreDataProperties.swift
//  Group Randomizer
//
//  Created by Christopher Thiebaut on 2/23/18.
//  Copyright © 2018 Christopher Thiebaut. All rights reserved.
//
//

import Foundation
import CoreData


extension Member {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Member> {
        return NSFetchRequest<Member>(entityName: "Member")
    }

    @NSManaged public var name: String
    @NSManaged public var group: Group?

}
