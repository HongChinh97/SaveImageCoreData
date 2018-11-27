//
//  Images+CoreDataProperties.swift
//  
//
//  Created by admin on 11/22/18.
//
//  This file was automatically generated and should not be edited.
//

import UIKit
//import Foundation
import  CoreData


extension Images {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Images> {
        return NSFetchRequest<Images>(entityName: "Images")
    }

    @NSManaged public var picture: UIImage?

}
