//
//  MyListViewModel.swift
//  Reminders
//
//  Created by Mohammad Azam on 2/18/22.
//

import Foundation
import CoreData

struct MyListViewModel: Identifiable {
    
    private let myList: MyList
    
    init(myList: MyList) {
        self.myList = myList
    }
    
    var id: NSManagedObjectID {
        myList.objectID
    }
    
    var name: String {
        myList.name ?? ""
    }
    
    var colorCode: String {
        myList.colorCode ?? ""
    }
    
}
