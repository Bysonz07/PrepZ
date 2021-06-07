//
//  Categories+CoreDataProperties.swift
//  PrepZ
//
//  Created by Difa N Pratama on 07/06/21.
//
//

import Foundation
import CoreData


extension Categories {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Categories> {
        return NSFetchRequest<Categories>(entityName: "Categories")
    }

    @NSManaged public var minute: Int64
    @NSManaged public var stepByStep: String?
    @NSManaged public var title: String?

}

extension Categories : Identifiable {

}
