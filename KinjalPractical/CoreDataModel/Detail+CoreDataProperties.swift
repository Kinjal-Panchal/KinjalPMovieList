//
//  Detail+CoreDataProperties.swift
//  KinjalPractical
//
//  Created by Kinjal panchal on 12/05/22.
//
//

import Foundation
import CoreData


extension Detail {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Detail> {
        return NSFetchRequest<Detail>(entityName: "Detail")
    }

    @NSManaged public var image: Data?
    @NSManaged public var coverimage: Data?
    @NSManaged public var overview: String?
    @NSManaged public var generes: String?
    @NSManaged public var duration: String?
    @NSManaged public var releasedate: String?
    @NSManaged public var productioncomapny: String?
    @NSManaged public var budget: String?
    @NSManaged public var revenue: String?
    @NSManaged public var language: String?

}

extension Detail : Identifiable {

}
