//
//  HomeViewModel.swift
//  Reminders
//
//  Created by Mohammad Azam on 2/18/22.
//

import Foundation
import CoreData

class HomeViewModel: NSObject, ObservableObject {
    
    private var fetchedResultsController: NSFetchedResultsController<MyList>
    private(set) var context: NSManagedObjectContext
    
    @Published var myLists: [MyListViewModel] = []
    
    override init() {
        self.context = CoreDataManager.shared.context
        fetchedResultsController = NSFetchedResultsController(fetchRequest: MyList.all, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        super.init()
        fetchedResultsController.delegate = self
        
        do {
            try fetchedResultsController.performFetch()
            guard let myLists = fetchedResultsController.fetchedObjects else { return }
            self.myLists = myLists.map(MyListViewModel.init)
            
        } catch {
            print(error)
        }
    }
    
    func saveNewList(newListName: String, colorCode: String) {
        
        let myList = MyList(context: context)
        myList.name = newListName
        myList.colorCode = colorCode
        do {
            try myList.save()
        } catch {
            print(error)
        }
        
    }

}

extension HomeViewModel: NSFetchedResultsControllerDelegate {
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        guard let myLists = controller.fetchedObjects as? [MyList] else { return }
        self.myLists = myLists.map(MyListViewModel.init)
    }
}
