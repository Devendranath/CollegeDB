//
//  College+CoreDataProperties.swift
//  CollegeDB
//
//  Created by apple on 07/06/19.
//  Copyright © 2019 iOSProofs. All rights reserved.
//
//

import Foundation
import CoreData


extension College {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<College> {
        return NSFetchRequest<College>(entityName: "College")
    }

    @NSManaged public var name: String?
    @NSManaged public var established: Int16
    @NSManaged public var phone: Int32
    @NSManaged public var address: String?

}
