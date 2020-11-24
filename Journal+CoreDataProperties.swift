//
//  Journal+CoreDataProperties.swift
//  SimpleJournalVIPER
//
//  Created by Michael Iskandar on 23/11/20.
//  Copyright © 2020 Michael Iskandar. All rights reserved.
//
//

import Foundation
import CoreData


extension Journal {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Journal> {
        return NSFetchRequest<Journal>(entityName: "Journal")
    }

    @NSManaged public var date: Date?
    @NSManaged public var id: Int16
    @NSManaged public var title: String?
    @NSManaged public var detail: String?
    @NSManaged public var mood: Mood?

}

extension Journal : Identifiable {

}
