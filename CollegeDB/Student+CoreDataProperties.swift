//
//  Student+CoreDataProperties.swift
//  CollegeDB
//
//  Created by apple on 08/06/19.
//  Copyright © 2019 iOSProofs. All rights reserved.
//
//

import Foundation
import CoreData


extension Student {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Student> {
        return NSFetchRequest<Student>(entityName: "Student")
    }

    @NSManaged public var name: String?
    @NSManaged public var rollNo: Int16
    @NSManaged public var branch: String?
    @NSManaged public var myCollege: College?

}
