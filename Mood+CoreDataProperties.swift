//
//  Mood+CoreDataProperties.swift
//  SimpleJournalVIPER
//
//  Created by Michael Iskandar on 23/11/20.
//  Copyright © 2020 Michael Iskandar. All rights reserved.
//
//

import Foundation
import CoreData


extension Mood {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Mood> {
        return NSFetchRequest<Mood>(entityName: "Mood")
    }

    @NSManaged public var happiness: Double
    @NSManaged public var mood: String?
    @NSManaged public var journal: Journal?

    
}

extension Mood : Identifiable {

}
