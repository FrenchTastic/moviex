//
//  Movie+CoreDataProperties.swift
//  moviex
//
//  Created by Romain Pardon on 07/08/2016.
//  Copyright © 2016 SlasherApp. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Movie {

    @NSManaged var title: String?
    @NSManaged var desc: String?
    @NSManaged var imdbSynopsis: String?
    @NSManaged var imdbUrl: String?
    @NSManaged var image: NSData?

}
