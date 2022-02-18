//
//  MyList+Extensions.swift
//  Reminders
//
//  Created by Mohammad Azam on 2/18/22.
//

import Foundation
import CoreData

extension MyList {
    
    static var all: NSFetchRequest<MyList> {
        let request = MyList.fetchRequest()
        request.sortDescriptors = []
        return request
    }
    
    func save() throws {
        try CoreDataManager.shared.context.save()
    }
}
