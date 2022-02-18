//
//  MyListsView.swift
//  Reminders
//
//  Created by Mohammad Azam on 2/17/22.
//

import SwiftUI

struct MyListsView: View {
    
    let myLists: [MyListViewModel]
    
    var body: some View {
        List(myLists) { myList in
           MyListCellView(vm: myList)
        }
    }
}

struct MyListsView_Previews: PreviewProvider {
    static var previews: some View {
        MyListsView(myLists: [])
    }
}
