//
//  College+CoreDataProperties.swift
//  CollegeDB
//
//  Created by apple on 08/06/19.
//  Copyright © 2019 iOSProofs. All rights reserved.
//
//

import Foundation
import CoreData


extension College {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<College> {
        return NSFetchRequest<College>(entityName: "College")
    }

    @NSManaged public var address: String?
    @NSManaged public var established: Int16
    @NSManaged public var name: String?
    @NSManaged public var phone: Int32
    @NSManaged public var students: NSSet?

}

// MARK: Generated accessors for students
extension College {

    @objc(addStudentsObject:)
    @NSManaged public func addToStudents(_ value: Student)

    @objc(removeStudentsObject:)
    @NSManaged public func removeFromStudents(_ value: Student)

    @objc(addStudents:)
    @NSManaged public func addToStudents(_ values: NSSet)

    @objc(removeStudents:)
    @NSManaged public func removeFromStudents(_ values: NSSet)

}
