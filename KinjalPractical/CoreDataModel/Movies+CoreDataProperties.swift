//
//  Movies+CoreDataProperties.swift
//  KinjalPractical
//
//  Created by Kinjal panchal on 12/05/22.
//
//

import Foundation
import CoreData


extension Movies {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Movies> {
        return NSFetchRequest<Movies>(entityName: "Movies")
    }

    @NSManaged public var title: String?
    @NSManaged public var date: String?
    @NSManaged public var subtitle: String?
    @NSManaged public var image: Data?

}

extension Movies : Identifiable {

}
